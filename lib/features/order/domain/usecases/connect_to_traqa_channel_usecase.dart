import 'package:fpdart/fpdart.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/order/order.dart';

class ConnectToTraqaChannelUsecase extends UseCaseFuture<Failure, void, NoParams> {
  final OrderRepository _orderRepository;

  ConnectToTraqaChannelUsecase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, void>> call(
    NoParams params,
  ) async {
    return await _orderRepository.getChannel();
  }
}
