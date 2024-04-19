import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key, required this.user});

  final TraqaUser user;

  static const String route = '/order-view';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfoHeader(user: user),
          verticalGap(screenHeight * .05),
        ],
      ),
      useSingleScroll: true,
    );
  }
}
