import 'package:traqa/core/core.dart';

class OrderStatusSection extends StatelessWidget {
  const OrderStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          sr(kMinute),
        ),
        border: Border.all(
          color: kText6Color,
        ),
      ),
    );
  }
}
