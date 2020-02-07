import 'package:flutter/material.dart';
import 'package:footprint_calculator/generated/l10n.dart';
import 'package:footprint_calculator/main.dart';

class DrawerBloc {
  Map<String, Widget> footprint(BuildContext context) =>
      {S.of(context).screen_name_footprint: Image.asset("assets/icons/footprint_selected.png")};

  Map<String, Widget> tips(BuildContext context) =>
      {S.of(context).screen_name_tips: Image.asset("assets/icons/tips_selected.png")};

  Map<String, Widget> game(BuildContext context) =>
      {S.of(context).screen_name_game: Image.asset("assets/icons/game_selected.png")};

  Map<String, Widget> shop(BuildContext context) =>
      {S.of(context).screen_name_shop: Image.asset("assets/icons/shop_selected.png")};

  Map<String, Widget> profile(BuildContext context) =>
      {S.of(context).screen_name_profile: Image.asset("assets/icons/profile_selected.png")};

  Map<String, Widget> about(BuildContext context) =>
      {S.of(context).screen_name_about: Image.asset("assets/icons/info_selected.png")};

  void navigateToMainDestination(VoidCallback callback, BuildContext context) {
    callback();
    _closeDrawer(context);
  }

  void navigateToProfile(BuildContext context) =>
      Navigator.of(context).popAndPushNamed(routes[Routes.PROFILE]);

  void navigateToAbout(BuildContext context) =>
      Navigator.of(context).popAndPushNamed(routes[Routes.ABOUT]);

  void _closeDrawer(BuildContext context) => Navigator.pop(context);
}
