import 'package:flutter/cupertino.dart';
import 'package:traqa/core/core.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({
    super.key,
    this.strokeWidth,
    this.value,
    this.size,
  });

  final double? strokeWidth;
  final double? value;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    if (size != null) {
      return SizedBox(
        width: size!.width,
        height: size!.height,
        child: CupertinoActivityIndicator(
          color: kText7Color,
          radius: size!.width / 2,
        ),
      );
    }

    return const CupertinoActivityIndicator(color: kText7Color);
  }
}
