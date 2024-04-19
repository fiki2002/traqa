import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case '/':
        return pageRoute(const SplashView());

      case OnboardingView.route:
        return pageRoute(const OnboardingView());

      case OrderView.route:
        return pageRoute(
          OrderView(
            user: args as TraqaUser,
          ),
        );

      case OrderStatusView.route:
        return pageRoute(
          const OrderStatusView(),
        );

      default:
        return errorRoute();
    }
  }

  static PageRoute pageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
