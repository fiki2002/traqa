import 'dart:async';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class TraqaDisplay extends StatefulWidget {
  const TraqaDisplay({super.key});

  @override
  State<TraqaDisplay> createState() => _TraqaDisplayState();
}

class _TraqaDisplayState extends State<TraqaDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;

  String traqa = 'Traqa';
  String text = '';
  late int textLength;
  late int _index;
  late bool isForward;
  late Timer timer;

  @override
  void initState() {
    context.auth.checkForAuthState();

    textLength = traqa.length;
    _index = -1;
    isForward = true;
    timer = Timer.periodic(
      const Duration(milliseconds: 250),
      (timer) {
        if (isForward) {
          _index++;
          if (_index > textLength) {
            _index--;
            isForward = false;
          }
        }
        setState(() => text = traqa.substring(0, _index));
      },
    );

    _initScaleAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      height: screenHeight,
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            text,
            fontSize: kXtremeLarge,
            textColor: kWhiteColor,
            isShantell: true,
          ),
          AnimatedSwitcher(
            duration: duration300ms,
            switchInCurve: Curves.fastEaseInToSlowEaseOut,
            child: text.length == 5
                ? ScaleTransition(
                    scale: _expandAnimation,
                    child: const CircleAvatar(
                      radius: 2,
                      backgroundColor: kWhiteColor,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  void _initScaleAnimation() {
    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _expandAnimation = Tween<double>(begin: 1, end: screenHeight * .5).animate(
      CurvedAnimation(
        parent: _expandController,
        curve: Curves.linear,
      ),
    );

    Future.delayed(
      duration3s,
      () => _expandController.forward(),
    );

    _expandAnimation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          final isAuthenticated = context.auth.isAuthenticated;
          final user = context.auth.user;
          if (isAuthenticated) {
            clearRoad(
              OrderView.route,
              arguments: user,
            );
          } else {
            clearRoad(OnboardingView.route);
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _expandController.dispose();
    timer.cancel();
    super.dispose();
  }
}
