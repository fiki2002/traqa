import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<dynamic>? goTo(String routeName, {Object? arguments}) {
  return navigatorKey.currentState?.pushNamed(
    routeName,
    arguments: arguments,
  );
}

Future<dynamic> go(Widget page) {
  return navigatorKey.currentState!.push(
    MaterialPageRoute(builder: (context) => page),
  );
}

Future<dynamic>? goReplace(String routeName) {
  return navigatorKey.currentState?.pushReplacementNamed(routeName);
}

Future<dynamic>? clearRoad(String routeName, {Object? arguments}) {
  return navigatorKey.currentState?.pushNamedAndRemoveUntil(
    routeName,
    ModalRoute.withName('/'),
    arguments: arguments,
  );
}

void goBack([Object? result]) {
  return navigatorKey.currentState!.pop(result);
}
