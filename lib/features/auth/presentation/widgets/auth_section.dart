import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class AuthSection extends StatelessWidget {
  const AuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sr(kGlobalPadding),
        vertical: sr(kfsMedium),
      ),
      height: screenHeight * .3,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sr(kfs32)),
          topRight: Radius.circular(sr(kfs32)),
        ),
      ),
      width: screenWidth,
      child: Column(
        children: [
          const TextWidget(
            'Welcome to Traqa',
            fontWeight: w700,
            fontSize: kGlobalPadding,
          ),
          const TextWidget(
            'Proceed to sign in',
            textColor: kText2Color,
            fontWeight: w500,
          ),
          verticalGap(screenHeight * .07),
          const Button(),
        ],
      ),
    );
  }
}
