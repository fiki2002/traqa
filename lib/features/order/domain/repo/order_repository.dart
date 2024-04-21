import 'package:ably_flutter/ably_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:traqa/core/core.dart';

abstract class OrderRepository {
  Future<Either<Failure, void>> getChannel();
  Stream<Either<Failure, Message>> getOrderUpdates();
}
