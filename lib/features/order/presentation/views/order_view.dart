import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key, required this.user});

  final TraqaUser user;

  static const String route = '/order-view';

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.order.connectToTraqaChannel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfoHeader(user: widget.user),
          vSpace(kfsExtraLarge),
          const OrderTracker(),
          vSpace(kfsExtraLarge),
          const OrderDetailsTile(),
        ],
      ),
      useSingleScroll: true,
    );
  }
}
