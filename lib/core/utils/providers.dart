import 'package:provider/single_child_widget.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

List<SingleChildWidget> _providers = [
  ChangeNotifierProvider(create: (_) => getIt<AuthNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<OrderNotifier>()),
];

List<SingleChildWidget> get providers => _providers;
