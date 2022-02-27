import 'package:flutter/material.dart';
import 'package:test_app_1/core/constants/route_constants.dart';
import 'package:test_app_1/features/astro_app/presentation/pages/home.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No route defined for ${settings.name}"),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(_);
                            },
                            child: const Text('Exit'))
                      ],
                    ),
                  ),
                ));
    }
  }
}
