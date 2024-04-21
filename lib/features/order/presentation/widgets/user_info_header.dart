import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({
    super.key,
    required this.user,
  });
  final TraqaUser user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              'Hello,',
            ),
            TextWidget(
              user.fullName.capitalize(),
              fontSize: kfsMedium,
              fontWeight: w600,
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
      ],
    );
  }
}
