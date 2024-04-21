import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class TraqaTrail extends StatelessWidget {
  const TraqaTrail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: sr(kfs8),
          backgroundColor: kBg2,
        ),
        hSpace(kSize5),
        const Expanded(child: _AnimatedTrail()),
        hSpace(kSize5),
        CircleAvatar(
          radius: sr(kfs8),
          backgroundColor: kBg2,
        ),
      ],
    );
  }
}

class _AnimatedTrail extends StatelessWidget {
  const _AnimatedTrail();

  @override
  Widget build(BuildContext context) {
    return Selector<OrderNotifier, (OrderTrackerState, double)>(
      builder: (_, viewModel, __) {
        return SizedBox(
          height: h(kfs32),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: h(3),
                width: screenWidth,
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  color: kBg3,
                ),
                child: AnimatedContainer(
                  duration: duration300ms,
                  height: h(3),
                  width: viewModel.$2,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                ),
              ),
              AnimatedPositioned(
                left: switch (viewModel.$1) {
                  OrderTrackerState.orderPlaced => 0,
                  OrderTrackerState.orderAccepted => screenWidth / 5,
                  OrderTrackerState.orderPickUpInProgress => screenWidth / 4,
                  OrderTrackerState.orderOnTheWayToCustomer => screenWidth / 3,
                  OrderTrackerState.orderArrived => screenWidth / 2,
                  OrderTrackerState.orderDelivered => screenWidth / 1.6,
                  _ => 0,
                },
                duration: duration300ms,
                child: CircleAvatar(
                  radius: sr(kfsMedium),
                  backgroundColor: kPrimaryColor,
                  child: carIcon.svg(),
                ),
              )
            ],
          ),
        );
      },
      selector: (_, viewModel) => (
        viewModel.orderStatus,
        viewModel.calculateContainerWidth(viewModel.orderStatus),
      ),
    );
  }
}
