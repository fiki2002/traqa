import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  final ValueNotifier<bool> _isPressed = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthNotifier>(
      builder: (__, viewModel, _) {
        return AnimatedSwitcher(
          duration: duration300ms,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            );
          },
          child: switch (viewModel.authState) {
            AuthState.loading => const LoadingIndicatorWidget(),
            _ => ValueListenableBuilder<bool>(
                valueListenable: _isPressed,
                builder: (context, value, _) {
                  return InkWell(
                    onTap: context.auth.signInWithGoogle,
                    onTapDown: (_) => _isPressed.value = true,
                    onTapCancel: () => _isPressed.value = false,
                    onTapUp: (_) => _isPressed.value = false,
                    child: AnimatedContainer(
                      duration: duration300ms,
                      padding: EdgeInsets.all(w(kMinute)),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: value ? Colors.grey.shade600 : kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: value
                            ? kText7Color.withOpacity(.1)
                            : Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            googleIcon,
                            width: w(kfsExtraLarge),
                            height: h(kfsExtraLarge),
                          ),
                          hSpace(kMinute),
                          const TextWidget(
                            'Sign in with  Google',
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
          },
        );
      },
    );
  }
}
