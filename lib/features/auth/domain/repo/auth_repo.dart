import 'package:fpdart/fpdart.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> signInWithGoogle();
}
