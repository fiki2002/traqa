import 'package:traqa/core/core.dart';

class OrderDetailsTile extends StatelessWidget {
  const OrderDetailsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          'Your Order',
          fontSize: kfsMedium,
          fontWeight: w600,
        ),
        vSpace(kfsMedium),
        const _OrderTile(),
      ],
    );
  }
}

class _OrderTile extends StatelessWidget {
  const _OrderTile();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            sr(kfsVeryTiny),
          ),
          child: Image.asset(
            spaghettiImage,
            height: h(kfs100),
            width: w(110),
            fit: BoxFit.cover,
          ),
        ),
        hSpace(kfsVeryTiny),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              'Spaghetti Bolognese',
              fontWeight: w500,
              fontSize: kfsMedium,
            ),
            vSpace(kSize5),
            const TextWidget(
              'Chicken and salad',
              textColor: kText2Color,
            ),
            vSpace(kfsVeryTiny),
            const RichTextWidget(
              text: 'Quantity: ',
              text2: '2',
              textColor: kText2Color,
            ),
            vSpace(kfsVeryTiny),
            const RichTextWidget(
              text: '\u20A6',
              fontFamily: '',
              text2: '5,000.00',
              fontWeight: w500,
              fontWeight2: w500,
              fontSize: kfsMedium,
              fontSize2: kfsMedium,
            )
          ],
        ),
      ],
    );
  }
}
