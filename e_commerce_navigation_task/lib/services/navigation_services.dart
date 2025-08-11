import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();
  
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }
  
  void goBack() {
    return navigatorKey.currentState!.pop();
  }
  
  Future<dynamic> navigateToAndReplace(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }
  
  Future<dynamic> navigateToAndClearStack(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}