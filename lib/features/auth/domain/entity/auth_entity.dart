import 'package:traqa/features/features.dart';

class AuthEntity {
  final String message;
  final bool isSuccess;
  final TraqaUserEntity user;

  AuthEntity({
    required this.message,
    required this.isSuccess,
    required this.user,
  });

  @override
  String toString() =>
      'AuthEntity(message: $message, isSuccess: $isSuccess, user: $user)';
}
