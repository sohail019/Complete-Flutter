import 'package:_08_boi_poka/core/utils/session_manager.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class AppRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _saveScreen(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _saveScreen(newRoute);
    }
  }

  void _saveScreen(Route route) {
    if (route.settings.name != null) {
      SessionManager.saveLastScreen(route.settings.name!);
    }
  }
}
