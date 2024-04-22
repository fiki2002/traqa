import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';
import 'package:mockito/annotations.dart';

import 'auth_notifier_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<SignInWithGoogleUsecase>(),
  ],
)
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockSignInWithGoogleUsecase mockSignInWithGoogleUsecase;
  late MockIsUserAuthenticatedUsecase mockIsUserAuthenticatedUsecase;
  late AuthNotifier authNotifier;

  setUp(
    () {
      mockSignInWithGoogleUsecase = MockSignInWithGoogleUsecase();
      mockIsUserAuthenticatedUsecase = MockIsUserAuthenticatedUsecase();
      authNotifier = AuthNotifier(
        signInWithGoogleUsecase: mockSignInWithGoogleUsecase,
        isUserAuthenticatedUsecase: mockIsUserAuthenticatedUsecase,
      );
    },
  );

  test(
    'is sign in successful',
    () async {
      final user = TraqaUserEntity(
        fullName: 'Test User',
        email: 'test@example.com',
        avatarUrl: 'https://example.com/avatar.png',
      );

      provideDummy<Either<Failure, AuthEntity>>(
        Right(
          AuthModel(
            user: user,
            message: 'Sign in successful!',
            isSuccess: true,
          ),
        ),
      );

      await authNotifier.signInWithGoogle();

      expect(authNotifier.authState, AuthState.success);
      expect(authNotifier.user, user);
    },
  );
}
