import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class OrderStatusTile extends StatelessWidget {
  const OrderStatusTile({
    super.key,
    required this.step,
  });

  final OrderTrackerState step;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderNotifier>(
      builder: (_, viewModel, __) {
        final bool isActive = viewModel.orderStatus.isGreater(step) ||
            viewModel.orderStatus == step;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  curve: Curves.elasticInOut,
                  duration: duration300ms,
                  constraints: const BoxConstraints(
                    maxWidth: 48,
                    maxHeight: 48,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: switch (isActive) {
                      true => kPrimaryColor,
                      false => kBg4,
                    },
                  ),
                  child: Center(
                    child: step.icon.svg(),
                  ),
                ),
                hSpace(kfs8),
                Expanded(
                  flex: 5,
                  child: AnimatedSwitcher(
                    duration: duration300ms,
                    switchInCurve: Curves.bounceIn,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          step.title,
                          textColor: isActive ? kBlack : kBg4,
                          fontWeight: w600,
                          fontSize: kfsMedium,
                        ),
                        vSpace(kfsVeryTiny),
                        SizedBox(
                          width: screenWidth * .6,
                          child: TextWidget(
                            step.description,
                            textColor: isActive ? kBlack : kBg4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: duration300ms,
                  opacity: isActive ? 1 : 0,
                  child: TextWidget(
                    viewModel.stageTime,
                    fontSize: kfsVeryTiny,
                    textColor: kText2Color,
                  ),
                ),
              ],
            ),
            if (step != OrderTrackerState.orderDelivered)
              AnimatedSwitcher(
                duration: duration300ms,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * .06,
                    top: h(kSize5),
                    bottom: w(kMinute),
                  ),
                  child: CustomPaint(
                    size: Size(1, screenWidth * .09),
                    painter: DottedBorder(
                      color: switch (isActive) {
                        true => kPrimaryColor,
                        false => kBg4,
                      },
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
