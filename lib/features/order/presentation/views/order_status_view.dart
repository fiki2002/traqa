import 'package:traqa/core/core.dart';
import 'package:traqa/core/utils/sizer.dart';
import 'package:traqa/features/features.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  static const String route = '/order-status';
  @override
  Widget build(BuildContext context) {
    late List<OrderTrackerState> stages = [
      OrderTrackerState.orderPlaced,
      OrderTrackerState.orderAccepted,
      OrderTrackerState.orderPickUpInProgress,
      OrderTrackerState.orderOnTheWayToCustomer,
      OrderTrackerState.orderArrived,
      OrderTrackerState.orderDelivered,
    ];

    return ScaffoldWidget(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        forceMaterialTransparency: true,
        backgroundColor: kBg1,
        title: const TextWidget(
          'Order Status',
          fontWeight: w600,
          fontSize: kfsMedium,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            'Order #123456',
            fontSize: kfsMedium,
            fontWeight: w600,
          ),
          vSpace(kfs32),
          const TextWidget(
            'Timeline',
            fontWeight: w600,
          ),
          verticalGap(screenHeight * .02),
          ...stages.map(
            (p0) => OrderStatusTile(step: p0),
          ),
          verticalGap(screenHeight * .02),
        ],
      ),
      useSingleScroll: true,
    );
  }
}
