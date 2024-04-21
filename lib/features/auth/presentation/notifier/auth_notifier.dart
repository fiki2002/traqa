import 'package:fpdart/fpdart.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class AuthNotifier extends ChangeNotifier {
  final SignInWithGoogleUsecase _signInWithGoogleUsecase;
  final IsUserAuthenticatedUsecase _isUserAuthenticatedUsecase;
  AuthNotifier({
    required SignInWithGoogleUsecase signInWithGoogleUsecase,
    required IsUserAuthenticatedUsecase isUserAuthenticatedUsecase,
  })  : _signInWithGoogleUsecase = signInWithGoogleUsecase,
        _isUserAuthenticatedUsecase = isUserAuthenticatedUsecase;

  TraqaUserEntity? _user;
  TraqaUserEntity? get user => _user;

  void signInWithGoogle() async {
    _setAuthState(AuthState.loading);
    final res = await _signInWithGoogleUsecase(const NoParams());

    res.fold(
      (l) {
        _setAuthState(AuthState.error);

        if (l.message == 'User cancelled operation') {
          return null;
        }

        Toast.showErrorToast(message: l.message);

        return Left(l);
      },
      (r) {
        _setAuthState(AuthState.success);

        _user = r.user;
        notifyListeners();

        clearRoad(
          OrderView.route,
          arguments: r.user,
        );
      },
    );
  }

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  void checkForAuthState() async {
    final res = await _isUserAuthenticatedUsecase(const NoParams());
    res.fold(
      (l) {},
      (r) {
        _isAuthenticated = r.isSuccess;
        _user = r.user;
        notifyListeners();
      },
    );
  }

  AuthState _authState = AuthState.idle;
  AuthState get authState => _authState;

  void _setAuthState(AuthState state) {
    _authState = state;
    notifyListeners();
  }
}

enum AuthState { idle, loading, success, error }
