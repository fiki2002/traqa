import 'dart:async';

import 'package:ably_flutter/ably_flutter.dart';
import 'package:intl/intl.dart';
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

  static final DateTime _now = DateTime.now();

  String _time = DateFormat('hh:mm a').format(_now);
  String get stageTime => _time;

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
                _time = DateFormat('hh:mm a').format(r.timestamp!);
                notifyListeners();
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

  double calculateContainerWidth(OrderTrackerState orderStatus) {
    double stepWidth = (screenWidth / 6) - 32;
    switch (orderStatus) {
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
}
