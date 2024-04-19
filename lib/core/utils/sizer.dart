import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traqa/core/core.dart';

double sh(double value) => (value / 100).sh;

double sw(double value) => (value / 100).sw;

double sp(double value) => value.sp;

double h(double value) => value.h;

double w(double value) => value.w;

double sr(double value) => value.r;

Widget vSpace(double value) => value.verticalSpace;

Widget hSpace(double value) => value.horizontalSpace;

Widget verticalGap(double value) => SizedBox(height: value);

double get screenWidth =>
    MediaQuery.sizeOf(navigatorKey.currentState!.context).width;

double get screenHeight =>
    MediaQuery.sizeOf(navigatorKey.currentState!.context).height;
