import 'package:edukids/models/models.dart';
import 'package:edukids/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {

  static const initialRoute = 'Welcome';

  static final menuOptions = <MenuOption>[
    // todo:borrar home
    MenuOption(route: 'Home', icon:Icons.home, nombre:'Home Screen', screen: const HomeScreen())
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'Welcome' : (BuildContext context)=> const WelcomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route : (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
