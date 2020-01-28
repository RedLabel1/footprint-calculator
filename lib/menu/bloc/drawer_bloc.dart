import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics.dart';
import 'package:footprint_calculator/main.dart';

class DrawerBloc implements Analytics {

  @override
  String get analyticsComponentName => "drawer_menu";

  Map<String, Widget> get footprint => {"Calcula tu huella": Image.asset("assets/icons/footprint_selected.png")};

  Map<String, Widget> get tips => {"Consejos": Image.asset("assets/icons/tips_selected.png")};

  Map<String, Widget> get game => {"Juego": Image.asset("assets/icons/game_selected.png")};

  Map<String, Widget> get shop => {"Tienda": Image.asset("assets/icons/shop_selected.png")};

  Map<String, Widget> get profile => {"Mi perfil": Image.asset("assets/icons/profile_selected.png")};

  Map<String, Widget> get about => {"Contacto & FAQ": Image.asset("assets/icons/info_selected.png")};

  void navigateToMainDestination(VoidCallback callback, BuildContext context) {
    callback();
    _closeDrawer(context);
  }

  void navigateToProfile(BuildContext context) => Navigator.of(context).popAndPushNamed(routes[Routes.PROFILE]);

  void navigateToAbout(BuildContext context) => Navigator.of(context).popAndPushNamed(routes[Routes.ABOUT]);

  void _closeDrawer(BuildContext context) => Navigator.pop(context);
}
