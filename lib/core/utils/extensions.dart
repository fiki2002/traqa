import 'package:flutter_svg/svg.dart';
import 'package:traqa/core/core.dart';
import 'package:traqa/features/features.dart';

extension NotifierExtension on BuildContext {
  AuthNotifier get auth => Provider.of<AuthNotifier>(this, listen: false);
  OrderNotifier get order => Provider.of<OrderNotifier>(this, listen: false);
}

extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      List<String> words = split(' ');
      if (words.length > 1) {
        for (int i = 0; i < words.length; i++) {
          if (words[i].isNotEmpty) {
            words[i] =
                words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
          }
        }
        return words.join(' ');
      }

      return words[0].toUpperCase() + words[0].substring(1).toLowerCase();
    }
    return '';
  }
}

extension SvgExtension on String {
  SvgPicture svg([Color? color]) => SvgPicture.asset(
        this,
        fit: BoxFit.scaleDown,
        // ignore: deprecated_member_use
        color: color,
      );
}
