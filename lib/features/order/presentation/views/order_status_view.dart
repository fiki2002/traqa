import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});
  static const String route = '/order-status';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        title: const TextWidget(
          "Order Status History",
          fontWeight: w700,
        ),
      ),
      body: Consumer<OrderNotifier>(builder: (context, orderNotifier, _) {
        final status = orderNotifier.orderStatus;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              "Timeline for order #123456",
              fontWeight: w600,
            ),
            verticalGap(screenHeight * .02),
            _tile(
              step: OrderTrackerState.orderPlaced,
              isCurrent: status == OrderTrackerState.orderPlaced,
              isActive: orderNotifier.orderStatus.isGreater(
                OrderTrackerState.orderPlaced,
              ),
            ),
            vSpace(kfsMedium),
            _tile(
              step: OrderTrackerState.orderAccepted,
              isCurrent: status == OrderTrackerState.orderAccepted,
              isActive: orderNotifier.orderStatus.isGreater(
                OrderTrackerState.orderAccepted,
              ),
            ),
            vSpace(kfsMedium),
            _tile(
              step: OrderTrackerState.orderPickUpInProgress,
              isCurrent: status == OrderTrackerState.orderPickUpInProgress,
              isActive: orderNotifier.orderStatus.isGreater(
                OrderTrackerState.orderPickUpInProgress,
              ),
            ),
            vSpace(kfsMedium),
            _tile(
              step: OrderTrackerState.orderOnTheWayToCustomer,
              isCurrent: status == OrderTrackerState.orderOnTheWayToCustomer,
              isActive: orderNotifier.orderStatus.isGreater(
                OrderTrackerState.orderOnTheWayToCustomer,
              ),
            ),
            vSpace(kfsMedium),
            _tile(
              step: OrderTrackerState.orderArrived,
              isCurrent: status == OrderTrackerState.orderArrived,
              isActive: orderNotifier.orderStatus.isGreater(
                OrderTrackerState.orderArrived,
              ),
            ),
            vSpace(kfsMedium),
            _tile(
              step: OrderTrackerState.orderDelivered,
              isCurrent: status == OrderTrackerState.orderDelivered,
              isActive: orderNotifier.orderStatus.isGreater(
                OrderTrackerState.orderDelivered,
              ),
            ),
            vSpace(kfsMedium),
          ],
        );
      }),
      useSingleScroll: true,
    );
  }
}

Widget _tile({
  bool isActive = false,
  bool isCurrent = false,
  required OrderTrackerState step,
}) {
  return Container(
    width: sw(100),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      color: kWhiteColor,
      borderRadius: BorderRadius.circular(sr(8)),
      border: Border.all(
        color: () {
          if (isActive) return kGreen;
          if (isCurrent) return kPrimaryColor;

          return kText2Color.withOpacity(.2);
        }(),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenWidth * .7,
              child: TextWidget(
                step.title,
                textAlign: TextAlign.start,
                fontWeight: isCurrent ? w700 : w400,
              ),
            ),
            Icon(
              () {
                if (isActive) return Icons.check_circle;
                if (isCurrent) return Icons.timelapse_rounded;

                return Icons.more_horiz;
              }(),
              color: () {
                if (isActive) return kGreen;
                if (isCurrent) return kPrimaryColor;

                return kText2Color;
              }(),
            ),
          ],
        ),
        vSpace(kSize5),
        Visibility(
          visible: (isActive || isCurrent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                step.description,
              ),
              vSpace(kMinute),
              const TextWidget(
                "03/05/24 ",
                textColor: kText5Color,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
