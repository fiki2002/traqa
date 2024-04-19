import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traqa/core/core.dart';

class TraqaApp extends StatelessWidget {
  const TraqaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, Widget? child) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp(
            title: 'Traqa',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: navigatorKey,
          ),
        );
      },
    );
  }
}
