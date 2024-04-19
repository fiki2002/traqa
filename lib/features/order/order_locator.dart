import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

void setOrderLocator() {
  /// DATASOURCE
  getIt.registerLazySingleton<OrderDataSource>(
    () => OrderDataSourceImpl(),
  );

  /// REPOSITORY
  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(
      orderDataSource: getIt<OrderDataSource>(),
    ),
  );

  /// USECASE
  getIt.registerLazySingleton<ConnectToTraqaChannelUsecase>(
    () => ConnectToTraqaChannelUsecase(
      orderRepository: getIt<OrderRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetOrderUpdatesUsecase>(
    () => GetOrderUpdatesUsecase(
      orderRepository: getIt<OrderRepository>(),
    ),
  );

  /// Notifier
  getIt.registerLazySingleton<OrderNotifier>(
    () => OrderNotifier(
      connectToTraqaChannelUsecase: getIt<ConnectToTraqaChannelUsecase>(),
      getOrderUpdatesUsecase: getIt<GetOrderUpdatesUsecase>(),
    ),
  );
}
