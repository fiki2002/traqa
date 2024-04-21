import 'package:carousel_slider/carousel_slider.dart';
import 'package:traqa/core/core.dart';

class OnboardingCarousel extends StatelessWidget {
  const OnboardingCarousel({super.key, required this.onboardingImages});
  final List<Image> onboardingImages;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      disableGesture: true,
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        viewportFraction: 1,
        height: screenHeight,
        autoPlayInterval: duration2s,
      ),
      itemBuilder: (context, index, realIndex) {
        return onboardingImages[index];
      },
    );
  }
}
