import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class OrderTracker extends StatelessWidget {
  const OrderTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderNotifier>(
      builder: (context, orderNotifier, child) {
        final status = orderNotifier.orderStatus;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStep(
                  step: OrderTrackerState.orderPlaced,
                  isCurrent: status == OrderTrackerState.orderPlaced,
                  isActive: orderNotifier.orderStatus.isGreater(
                    OrderTrackerState.orderPlaced,
                  ),
                ),
                _buildStep(
                  step: OrderTrackerState.orderAccepted,
                  isCurrent: status == OrderTrackerState.orderAccepted,
                  isActive: orderNotifier.orderStatus.isGreater(
                    OrderTrackerState.orderAccepted,
                  ),
                ),
                _buildStep(
                  step: OrderTrackerState.orderPickUpInProgress,
                  isCurrent: status == OrderTrackerState.orderPickUpInProgress,
                  isActive: orderNotifier.orderStatus.isGreater(
                    OrderTrackerState.orderPickUpInProgress,
                  ),
                ),
                _buildStep(
                  step: OrderTrackerState.orderOnTheWayToCustomer,
                  isCurrent:
                      status == OrderTrackerState.orderOnTheWayToCustomer,
                  isActive: orderNotifier.orderStatus.isGreater(
                    OrderTrackerState.orderOnTheWayToCustomer,
                  ),
                ),
                _buildStep(
                  step: OrderTrackerState.orderArrived,
                  isCurrent: status == OrderTrackerState.orderArrived,
                  isActive: orderNotifier.orderStatus.isGreater(
                    OrderTrackerState.orderArrived,
                  ),
                ),
                _buildStep(
                  step: OrderTrackerState.orderDelivered,
                  isCurrent: status == OrderTrackerState.orderDelivered,
                  isActive: orderNotifier.orderStatus.isGreater(
                    OrderTrackerState.orderDelivered,
                  ),
                ),
              ],
            ),
            vSpace(kfsMedium),
            TextWidget(
              status.title,
              fontWeight: w600,
              textAlign: TextAlign.center,
              fontSize: kfsMedium,
            ),
            vSpace(kfsMedium),
            InkWell(
              onTap: () => goTo(OrderStatusView.route),
              child: Container(
                height: h(kfs48),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(
                    sr(kMinute),
                  ),
                ),
                child: const Center(
                  child: TextWidget(
                    'Track your order',
                    fontWeight: w700,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStep({
    required OrderTrackerState step,
    bool isCurrent = false,
    bool isActive = false,
  }) {
    return AnimatedContainer(
      duration: duration300ms,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: () {
          if (isActive) return kGreen;
          if (isCurrent) return kPrimaryColor;

          return kText2Color.withOpacity(.2);
        }(),
        border: Border.all(
          color: () {
            if (isActive) return kGreen;
            if (isCurrent) return kPrimaryColor;

            return kText2Color;
          }(),
        ),
      ),
      child: Center(
        child: isActive
            ? const Icon(
                Icons.check,
                color: kWhiteColor,
              )
            : Text(
                (step.index + 1).toString(),
                style: TextStyle(
                  color: isActive ? Colors.white : kBlack,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
