import 'package:traqa/core/core.dart';

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

    final int currentStage = orderMap[this] ?? -1;
    final int nextStage = orderMap[other] ?? -1;
    return currentStage > nextStage;
  }

  String get title {
    switch (this) {
      case OrderTrackerState.orderPlaced:
        return 'Order has been placed';
      case OrderTrackerState.orderAccepted:
        return 'Order has been accepted';
      case OrderTrackerState.orderPickUpInProgress:
        return 'Order has been picked up';
      case OrderTrackerState.orderOnTheWayToCustomer:
        return 'Order is on the way';
      case OrderTrackerState.orderArrived:
        return 'Order has arrived';
      case OrderTrackerState.orderDelivered:
        return 'Order has been delivered!';
      case OrderTrackerState.unknown:
        return 'Unknown Order Status';
    }
  }

  String get icon {
    switch (this) {
      case OrderTrackerState.orderPlaced:
        return editIcon;
      case OrderTrackerState.orderAccepted:
        return checkedIcon;
      case OrderTrackerState.orderPickUpInProgress:
        return packageIcon;
      case OrderTrackerState.orderOnTheWayToCustomer:
        return bikeIcon;
      case OrderTrackerState.orderArrived:
        return arrivedIcon;
      case OrderTrackerState.orderDelivered:
        return deliveredIcon;
      case OrderTrackerState.unknown:
        return editIcon;
    }
  }

  String get description {
    switch (this) {
      case OrderTrackerState.orderPlaced:
        return 'Your order has been successfully placed. We are'
            ' preparing your items with care.';
      case OrderTrackerState.orderAccepted:
        return 'Great news! Your order has been accepted, and we are getting '
            'it ready for you.';
      case OrderTrackerState.orderPickUpInProgress:
        return 'Our team is currently picking up your order. Rest assured, it '
            'will be on its way to you soon!';
      case OrderTrackerState.orderOnTheWayToCustomer:
        return 'Exciting news! Your order is now on its way to you. We '
            'appreciate your patience.';
      case OrderTrackerState.orderArrived:
        return 'Hooray! Your order has arrived at its destination. We '
            'hope you enjoy your items!';
      case OrderTrackerState.orderDelivered:
        return 'Congratulations! Your order has been successfully delivered.'
            ' We hope you love your purchase!';
      case OrderTrackerState.unknown:
        return 'We couldn\'t determine the status of your order at the'
            ' moment. Please contact customer support for assistance.';
    }
  }
}
