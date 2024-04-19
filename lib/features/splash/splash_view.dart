import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      bg: kPrimaryColor,
      body: TraqDisplay(),
      useSingleScroll: false,
      usePadding: false,
      safeAreaTop: false,
    );
  }
}
