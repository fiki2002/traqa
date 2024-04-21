import 'package:fpdart/fpdart.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class AuthRepoImpl extends AuthRepository with RepositoryExceptionHandler {
  final AuthDataSource _authDataSource;

  AuthRepoImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;

  @override
  Future<Either<Failure, AuthEntity>> signInWithGoogle() async {
    return callAction(
      () => _authDataSource.signInWithGoogle(),
    );
  }

  @override
  Future<Either<Failure, AuthModel>> isUserAuthenticated() {
    return callAction(
      () => _authDataSource.isUserAuthenticated(),
    );
  }
}
