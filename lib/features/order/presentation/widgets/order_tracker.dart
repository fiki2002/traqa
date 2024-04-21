import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class OrderTracker extends StatelessWidget {
  const OrderTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kfsMedium),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(sr(kfsVeryTiny)),
        boxShadow: const [
          BoxShadow(
            color: kText8Color,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichTextWidget(
                text: 'ID: ',
                text2: '123456',
                fontWeight2: w500,
                textColor: kText2Color,
              ),
              TextWidget(
                '03 Apr 2024',
                textColor: kText2Color,
              ),
            ],
          ),
          vSpace(kfsExtraLarge),
          Selector<OrderNotifier, OrderTrackerState>(
            builder: (_, status, __) {
              return TextWidget(
                status.title,
                fontWeight: w500,
                fontSize: kfsLarge,
              );
            },
            selector: (_, viewModel) => viewModel.orderStatus,
          ),
          vSpace(kfsExtraLarge),
          const TraqaTrail(),
          vSpace(kfsExtraLarge),
          const RichTextWidget(
            text: 'Order Type: ',
            text2: 'Instant',
            textColor: kText2Color,
          ),
          vSpace(kGlobalPadding),
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
                  'Track order',
                  fontSize: kfsMedium,
                  fontWeight: w600,
                  textColor: kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
