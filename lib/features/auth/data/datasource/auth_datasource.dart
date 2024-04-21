import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

abstract interface class AuthDataSource {
  Future<AuthModel> signInWithGoogle();
  Future<bool> isUserAuthenticated();
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
  Future<bool> isUserAuthenticated() async {
    return FirebaseAuth.instance.currentUser != null;
  }
}
