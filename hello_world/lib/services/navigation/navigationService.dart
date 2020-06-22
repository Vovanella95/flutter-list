import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, Object parameter) {
    if (parameter != null) {
      return navigatorKey.currentState
          .pushNamed(routeName, arguments: parameter);
    }
    return navigatorKey.currentState.pushNamed(routeName);
  }
}
