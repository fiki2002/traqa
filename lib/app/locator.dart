import 'package:get_it/get_it.dart';
import 'package:traqa/features/features.dart';

final GetIt getIt = GetIt.instance;

class SetUpLocators {
  static const SetUpLocators _instance = SetUpLocators._();
  const SetUpLocators._();
  factory SetUpLocators() => _instance;

  static Future<void> init() async {
    setUpAuthLocator();

    setOrderLocator();
  }
}
