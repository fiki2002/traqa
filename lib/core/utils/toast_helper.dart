
import 'package:another_flushbar/flushbar.dart';
import 'package:traqa/core/core.dart';

class Toast {
  static void showErrorToast({required String message}) {
    _toast(
      message: message,
      type: _ToastType.error,
    );
  }

  static void showWarningToast({required String message}) {
    _toast(
      message: message,
      type: _ToastType.warning,
    );
  }

  static void showSuccessToast({required String message}) {
    _toast(
      message: message,
      type: _ToastType.success,
    );
  }

  static void _toast({
    required String message,
    required _ToastType type,
  }) {
    Flushbar(
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      padding: EdgeInsets.symmetric(
        horizontal: w(kfsMedium),
        vertical: h(kGlobalPadding),
      ),
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
      margin: EdgeInsets.symmetric(
        horizontal: w(kfs8),
        vertical: screenHeight * .01,
      ),
      borderRadius: BorderRadius.circular(sr(kMinute)),
      messageSize: sp(kfsMedium),
      backgroundColor: switch (type) {
        _ToastType.error => kRed,
        _ToastType.warning => kPrimaryColor,
        _ToastType.success => kGreen,
      },
      messageColor: switch (type) {
        _ToastType.error => kWhiteColor,
        _ToastType.warning => kWhiteColor,
        _ToastType.success => kWhiteColor,
      },
      duration: duration2s,
      icon: Icon(
        switch (type) {
          _ToastType.error => Icons.error_outline_rounded,
          _ToastType.warning => Icons.warning_amber_rounded,
          _ToastType.success => Icons.done_all_rounded,
        },
        color: switch (type) {
          _ToastType.error => kWhiteColor,
          _ToastType.warning => kWhiteColor,
          _ToastType.success => kWhiteColor,
        },
      ),
    ).show(navigatorKey.currentState!.context);
  }
}

enum _ToastType { error, warning, success }
