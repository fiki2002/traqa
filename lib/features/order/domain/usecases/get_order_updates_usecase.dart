import 'package:ably_flutter/ably_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/order/order.dart';

class GetOrderUpdatesUsecase extends UseCaseStream<Failure, Message, NoParams> {
  final OrderRepository _orderRepository;

  GetOrderUpdatesUsecase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Stream<Either<Failure, Message>> call(NoParams params) {
    return _orderRepository.getOrderUpdates();
  }
}
