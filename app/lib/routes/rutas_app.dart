import 'package:flutter/material.dart';
import '../models/menu_option.dart';
import '../screens/pantalla_principal.dart';

class RutasApp {
  static const initialRoute = 'principal';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'principal',
        name: 'Principal',
        screen: PantallaPrincipal(),
        icon: Icons.home),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }
}
