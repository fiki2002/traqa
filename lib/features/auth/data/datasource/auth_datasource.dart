import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

abstract interface class AuthDataSource {
  Future<AuthModel> signInWithGoogle();
  Future<AuthModel> isUserAuthenticated();
}

class AuthDataSourceImpl extends AuthDataSource {
  final GoogleSignIn _googleSignIn;

  AuthDataSourceImpl({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  @override
  Future<AuthModel> signInWithGoogle() async {
    final GoogleSignInAccount? user = await _googleSignIn.signIn();

    if (user == null) {
      throw const NoGoogleAccountChosenException();
    }
    final GoogleSignInAuthentication googleAuth = await user.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userDetailsResponse =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return AuthModel(
      message: 'Sign in successful!',
      isSuccess: true,
      user: TraqaUser(
        fullName: userDetailsResponse.user?.displayName ?? '',
        email: userDetailsResponse.user?.email ?? '',
        avatarUrl: userDetailsResponse.user?.photoURL ?? '',
      ),
    );
  }

  @override
  Future<AuthModel> isUserAuthenticated() async {
    final res = FirebaseAuth.instance.currentUser;

    if (res == null) {
      throw const BaseFailures(message: 'User is not authenticated');
    }
    return AuthModel(
      message: 'User is authenticated',
      isSuccess: true,
      user: TraqaUser(
        fullName: res.displayName ?? '',
        email: res.email ?? '',
        avatarUrl: res.photoURL ?? '',
      ),
    );
  }
}
