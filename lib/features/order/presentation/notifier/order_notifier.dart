import 'dart:async';

import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class OrderNotifier extends ChangeNotifier {
  final ConnectToTraqaChannelUsecase _connectToTraqaChannelUsecase;
  final GetOrderUpdatesUsecase _getOrderUpdatesUsecase;

  OrderNotifier({
    required ConnectToTraqaChannelUsecase connectToTraqaChannelUsecase,
    required GetOrderUpdatesUsecase getOrderUpdatesUsecase,
  })  : _connectToTraqaChannelUsecase = connectToTraqaChannelUsecase,
        _getOrderUpdatesUsecase = getOrderUpdatesUsecase;

  OrderTrackerState _orderStatus = OrderTrackerState.orderPlaced;

  OrderTrackerState get orderStatus => _orderStatus;

  Future<void> connectToTraqaChannel() async {
    final res = await _connectToTraqaChannelUsecase(const NoParams());

    res.fold(
      (l) {
        Toast.showErrorToast(message: l.message);
      },
      (r) {
        _getOrderUpdates();
      },
    );
  }

  void _getOrderUpdates() {
    final res = _getOrderUpdatesUsecase();

    res.listen(
      (event) {
        final message = event.data as String;
        if (message.isNotEmpty) {
          _orderStatus = stringToOrderStatus(message);
          notifyListeners();
        } else {
          _orderStatus = OrderTrackerState.orderPlaced;
        }
      },
      cancelOnError: true,
      onError: (error) {
        Toast.showErrorToast(message: error);
      },
    );
  }
}

enum OrderTrackerState {
  orderPlaced,
  orderAccepted,
  orderPickUpInProgress,
  orderOnTheWayToCustomer,
  orderArrived,
  orderDelivered,
  unknown,
}

OrderTrackerState stringToOrderStatus(String value) {
  switch (value) {
    case 'order_placed':
      return OrderTrackerState.orderPlaced;
    case 'order_accepted':
      return OrderTrackerState.orderAccepted;
    case 'order_pick_up_in_progress':
      return OrderTrackerState.orderPickUpInProgress;
    case 'order_on_the_way_to_customer':
      return OrderTrackerState.orderOnTheWayToCustomer;
    case 'order_arrived':
      return OrderTrackerState.orderArrived;
    case 'order_delivered':
      return OrderTrackerState.orderDelivered;
    default:
      return OrderTrackerState.orderPlaced;
  }
}

extension OrderStatusExtension on OrderTrackerState {
  bool isGreater(OrderTrackerState other) {
    final orderMap = {
      OrderTrackerState.unknown: 0,
      OrderTrackerState.orderPlaced: 1,
      OrderTrackerState.orderAccepted: 2,
      OrderTrackerState.orderPickUpInProgress: 3,
      OrderTrackerState.orderOnTheWayToCustomer: 4,
      OrderTrackerState.orderArrived: 5,
      OrderTrackerState.orderDelivered: 6,
    };

    final int thisOrder = orderMap[this] ?? -1;
    final int otherOrder = orderMap[other] ?? -1;
    return thisOrder > otherOrder;
  }

  String get title {
    switch (this) {
      case OrderTrackerState.orderPlaced:
        return 'Your Order has been placed😀';
      case OrderTrackerState.orderAccepted:
        return 'Your order has been accepted and is been processed';
      case OrderTrackerState.orderPickUpInProgress:
        return 'Your order has been picked up';
      case OrderTrackerState.orderOnTheWayToCustomer:
        return 'Your order is on the way to you';
      case OrderTrackerState.orderArrived:
        return 'Your order has arrived at your location';
      case OrderTrackerState.orderDelivered:
        return 'Your order has been delivered!🥳';
      case OrderTrackerState.unknown:
        return 'Unknown Order Status';
    }
  }

  String get description {
    switch (this) {
      case OrderTrackerState.orderPlaced:
        return 'Your order has been successfully placed. We are preparing your items with care.';
      case OrderTrackerState.orderAccepted:
        return 'Great news! Your order has been accepted, and we are getting it ready for you.';
      case OrderTrackerState.orderPickUpInProgress:
        return 'Our team is currently picking up your order. Rest assured, it will be on its way to you soon!';
      case OrderTrackerState.orderOnTheWayToCustomer:
        return 'Exciting news! Your order is now on its way to you. We appreciate your patience.';
      case OrderTrackerState.orderArrived:
        return 'Hooray! Your order has arrived at its destination. We hope you enjoy your items!';
      case OrderTrackerState.orderDelivered:
        return 'Congratulations! Your order has been successfully delivered. We hope you love your purchase!';
      case OrderTrackerState.unknown:
        return 'We couldn\'t determine the status of your order at the moment. Please contact customer support for assistance.';
    }
  }
}
