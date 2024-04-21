class TraqaUserEntity {
  final String fullName;
  final String email;
  final String avatarUrl;
  TraqaUserEntity({
    required this.fullName,
    required this.email,
    required this.avatarUrl,
  });

  @override
  String toString() => 'TraqaUserEntity(fullName: $fullName, email: $email, '
      'avatarUrl: $avatarUrl)';
}
