import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traqa/core/core.dart';

class Setup {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    await ScreenUtil.ensureScreenSize();

    await Firebase.initializeApp();

    await SetUpLocators.init();

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }
}
