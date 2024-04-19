import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

extension NotifierExtension on BuildContext {
  AuthNotifier get auth => Provider.of<AuthNotifier>(this, listen: false);
  OrderNotifier get order => Provider.of<OrderNotifier>(this, listen: false);
}
