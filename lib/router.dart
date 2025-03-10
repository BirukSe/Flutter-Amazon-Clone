import 'package:e_comm/features/auth/screens/auth_screen.dart';
import 'package:e_comm/features/auth/screens/home_screen.dart';
import 'package:flutter/material.dart';
import './common/widgets/bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => BottomBar());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                  body: Center(
                child: Text('Screen does not exist'),
              )));
  }
}
