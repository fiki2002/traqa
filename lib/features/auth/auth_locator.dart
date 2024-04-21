import 'package:google_sign_in/google_sign_in.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

void setUpAuthLocator() {
  /// DataSource
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      googleSignIn: GoogleSignIn(),
    ),
  );

  /// Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepoImpl(
      authDataSource: getIt<AuthDataSource>(),
    ),
  );

  /// Usecase
  getIt.registerLazySingleton<SignInWithGoogleUsecase>(
    () => SignInWithGoogleUsecase(
      authRepository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<AuthNotifier>(
    () => AuthNotifier(
      signInWithGoogleUsecase: getIt<SignInWithGoogleUsecase>(),
      isUserAuthenticatedUsecase: getIt<IsUserAuthenticatedUsecase>(),
    ),
  );
}
