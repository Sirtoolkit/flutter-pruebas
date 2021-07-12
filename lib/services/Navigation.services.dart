part of 'services.dart';

class NavigationServices {
  static GlobalKey<NavigatorState>? navigatorKey;

  static init() async {
    navigatorKey = new GlobalKey<NavigatorState>();
    return navigatorKey;
  }

  static Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey!.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> navigateReplaceTo(String routeName,
      {dynamic arguments}) {
    return navigatorKey!.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    return navigatorKey!.currentState!.pop();
  }
}
