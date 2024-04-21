import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class SignInWithGoogleUsecase
    implements UseCaseFuture<Failure, AuthEntity, NoParams> {
  final AuthRepository _authRepository;

  const SignInWithGoogleUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, AuthEntity>> call(NoParams params) async {
    return await _authRepository.signInWithGoogle();
  }
}
