import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class IsUserAuthenticatedUsecase
    implements UseCaseFuture<Failure, AuthModel, NoParams> {
  final AuthRepository _authRepository;

  const IsUserAuthenticatedUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, AuthModel>> call(NoParams params) async {
    return await _authRepository.isUserAuthenticated();
  }
}
