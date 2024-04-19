import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static const String route = '/onboarding';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late List<Image> onboardImages;

  @override
  void initState() {
    onboardImages = [
      Image.asset(
        onboardImage1,
        fit: BoxFit.cover,
      ),
      Image.asset(
        onboardImage2,
        fit: BoxFit.cover,
      ),
      Image.asset(
        onboardImage3,
        fit: BoxFit.cover,
      ),
    ];

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var image in onboardImages) {
      precacheImage(image.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      bg: kBlack,
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            OnboardingCarousel(
              onboardingImages: onboardImages,
            ),
            const Positioned(
              bottom: 0,
              child: AuthSection(),
            ),
          ],
        ),
      ),
      safeAreaTop: false,
      usePadding: false,
      useSingleScroll: false,
    );
  }
}
