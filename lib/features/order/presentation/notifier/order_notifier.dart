import 'dart:async';

import 'package:ably_flutter/ably_flutter.dart';
import 'package:intl/intl.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';
import 'package:traqa/features/order/order.dart';

class OrderNotifier extends ChangeNotifier {
  final ConnectToTraqaChannelUsecase _connectToTraqaChannelUsecase;
  final GetOrderUpdatesUsecase _getOrderUpdatesUsecase;

  OrderNotifier({
    required ConnectToTraqaChannelUsecase connectToTraqaChannelUsecase,
    required GetOrderUpdatesUsecase getOrderUpdatesUsecase,
  })  : _connectToTraqaChannelUsecase = connectToTraqaChannelUsecase,
        _getOrderUpdatesUsecase = getOrderUpdatesUsecase;

  /// To keep track of each order time
  String? _orderAcceptedTime;
  String? _orderPickUpInProgressTime;
  String? _orderOnTheWayToCustomerTime;
  String? _orderArrivedTime;
  String? _orderDeliveredTime;

  Future<void> connectToTraqaChannel() async {
    final res = await _connectToTraqaChannelUsecase(const NoParams());

    res.fold(
      (l) {
        Toast.showErrorToast(
          message: 'Something went wrong while connecting to traqa',
        );
      },
      (r) {
        _getOrderUpdates();
      },
    );
  }

  OrderTrackerState _orderStatus = OrderTrackerState.orderPlaced;

  OrderTrackerState get orderStatus => _orderStatus;

  void _getOrderUpdates() {
    final res = _getOrderUpdatesUsecase(const NoParams());

    res.listen(
      (event) {
        event.fold(
          (Failure l) {
            _orderStatus = OrderTrackerState.unknown;
            notifyListeners();
          },
          (Message? r) {
            AppLogger.log(r);
            if (r != null) {
              final message = (r.data) as String;

              if (message.isNotEmpty) {
                _orderStatus = stringToOrderStatus(message);
                notifyListeners();

                _setStageTime(DateFormat('hh:mm a').format(r.timestamp!));
              } else {
                _orderStatus = OrderTrackerState.orderPlaced;
                notifyListeners();
              }
            }
          },
        );
      },
      cancelOnError: true,
      onError: (error) {
        Toast.showErrorToast(message: error);
      },
    );
  }

  double calculateContainerWidth() {
    double stepWidth = (screenWidth / 6) - 32;
    switch (_orderStatus) {
      case OrderTrackerState.orderPlaced:
        return 0;
      case OrderTrackerState.orderAccepted:
        return stepWidth * 2.5;
      case OrderTrackerState.orderPickUpInProgress:
        return stepWidth * 3.5;
      case OrderTrackerState.orderOnTheWayToCustomer:
        return stepWidth * 4.5;
      case OrderTrackerState.orderArrived:
        return stepWidth * 6.5;
      case OrderTrackerState.orderDelivered:
        return screenWidth;
      default:
        return 0;
    }
  }

  String? getStageTime(OrderTrackerState status) {
    switch (status) {
      case OrderTrackerState.orderPlaced:
        return '10:00 AM';
      case OrderTrackerState.orderAccepted:
        return _orderAcceptedTime;
      case OrderTrackerState.orderPickUpInProgress:
        return _orderPickUpInProgressTime;
      case OrderTrackerState.orderOnTheWayToCustomer:
        return _orderOnTheWayToCustomerTime;
      case OrderTrackerState.orderArrived:
        return _orderArrivedTime;
      case OrderTrackerState.orderDelivered:
        return _orderDeliveredTime;
      default:
        return _orderAcceptedTime;
    }
  }

  void _setStageTime(String time) {
    switch (_orderStatus) {
      case OrderTrackerState.orderAccepted:
        _orderAcceptedTime = time;
        notifyListeners();
        break;
      case OrderTrackerState.orderPickUpInProgress:
        _orderPickUpInProgressTime = time;
        notifyListeners();
        break;
      case OrderTrackerState.orderOnTheWayToCustomer:
        _orderOnTheWayToCustomerTime = time;
        notifyListeners();
        break;
      case OrderTrackerState.orderArrived:
        _orderArrivedTime = time;
        notifyListeners();
        break;
      case OrderTrackerState.orderDelivered:
        _orderDeliveredTime = time;
        notifyListeners();
        break;
      default:
        break;
    }
  }
}
