import 'package:ably_flutter/ably_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class OrderRepositoryImpl extends OrderRepository
    with RepositoryExceptionHandler {
  final OrderDataSource _orderDataSource;

  OrderRepositoryImpl({
    required OrderDataSource orderDataSource,
  }) : _orderDataSource = orderDataSource;

  @override
  Future<Either<Failure, void>> getChannel() async {
    return callAction(() => _orderDataSource.connectToTraqaChannel());
  }

  @override
  Stream<Either<Failure, Message>> getOrderUpdates() {
    return callStreamAction(() => _orderDataSource.getOrderUpdates());
  }
}
