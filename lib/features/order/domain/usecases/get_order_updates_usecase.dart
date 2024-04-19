import 'package:ably_flutter/ably_flutter.dart';
import 'package:traqa/features/features.dart';

class GetOrderUpdatesUsecase {
  final OrderRepository _orderRepository;

  GetOrderUpdatesUsecase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  Stream<Message> call() {
    return _orderRepository.getOrderUpdates();
  }
}
