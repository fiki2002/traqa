import 'package:traqa/core/core.dart';

class OrderDetailsTile extends StatelessWidget {
  const OrderDetailsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: screenHeight * .2,
        padding: EdgeInsets.symmetric(
          horizontal: w(kfsMedium),
          vertical: h(kfsMedium),
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(
            sr(kfsMedium),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(sr(kMinute)),
              child: Image.asset(
                spaghettiImage,
              ),
            ),
            hSpace(kMinute),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  'Spaghetti bolognese',
                  fontWeight: w700,
                  fontSize: kfsMedium,
                ),
                vSpace(kSize5),
                const _Tile(
                  title: 'Order ID:',
                  subtitle: '#123456',
                ),
                vSpace(kSize5),
                const _Tile(
                  title: 'Order Date:',
                  subtitle: '03/05/24',
                ),
                vSpace(kSize5),
                const _Tile(
                  title: 'Order Type:',
                  subtitle: 'Instant',
                ),
                vSpace(kMinute),
                const TextWidget(
                  'Tap to view more details',
                  textColor: kBlack,
                  decoration: TextDecoration.underline,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          title,
          fontWeight: w600,
          textColor: kText2Color,
        ),
        hSpace(kMinute),
        TextWidget(subtitle),
      ],
    );
  }
}
