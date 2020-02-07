import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:footprint_calculator/about/about.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/footprint/bloc/footprint_bloc.dart';
import 'package:footprint_calculator/footprint/step1/footprint_step_1.dart';
import 'package:footprint_calculator/generated/l10n.dart';
import 'package:footprint_calculator/menu/bloc/drawer_bloc.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:footprint_calculator/menu/view/main_app_bar.dart';
import 'package:footprint_calculator/menu/view/body.dart';
import 'package:footprint_calculator/menu/view/bottom_nav_bar.dart';
import 'package:footprint_calculator/menu/view/drawer.dart';
import 'package:footprint_calculator/profile/profile.dart';
import 'package:provider/provider.dart';

void main() => runApp(footprintCalculator());

MultiProvider footprintCalculator() => MultiProvider(
      providers: [
        Provider<MainNavigationBloc>(
            create: (_) => MainNavigationBloc(), dispose: (_, bloc) => bloc.dispose()),
        Provider<FootprintBloc>(create: (_) => FootprintBloc()),
        Provider<DrawerBloc>(create: (_) => DrawerBloc()),
        Provider<AnalyticsBloc>(create: (_) => AnalyticsBloc()),
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          routes[Routes.MAIN]: (_) => Main(),
          routes[Routes.PROFILE]: (_) => Profile(),
          routes[Routes.ABOUT]: (_) => About(),
          routes[Routes.FOOTPRINT_STEP_1]: (_) => FootprintStep1(),
          routes[Routes.FOOTPRINT_STEP_2]: (_) => About(),
          routes[Routes.FOOTPRINT_STEP_3]: (_) => About(),
          routes[Routes.FOOTPRINT_STEP_4]: (_) => About(),
          routes[Routes.FOOTPRINT_STEP_5]: (_) => About(),
          routes[Routes.FOOTPRINT_END]: (_) => About(),
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _safeArea(),
      appBar: MainAppBar(),
      bottomNavigationBar: BottomNavBar(),
      endDrawer: AgresteDrawer(),
    );
  }
}

SafeArea _safeArea() => SafeArea(child: Body());

const routes = {
  Routes.MAIN: "/",
  Routes.PROFILE: "/profile",
  Routes.ABOUT: "/about",
  Routes.FOOTPRINT_STEP_1: "/footprintStep1",
  Routes.FOOTPRINT_STEP_2: "/footprintStep2",
  Routes.FOOTPRINT_STEP_3: "/footprintStep3",
  Routes.FOOTPRINT_STEP_4: "/footprintStep4",
  Routes.FOOTPRINT_STEP_5: "/footprintStep5",
  Routes.FOOTPRINT_END: "/footprintEnd",
};

enum Routes {
  MAIN,
  PROFILE,
  ABOUT,
  FOOTPRINT_STEP_1,
  FOOTPRINT_STEP_2,
  FOOTPRINT_STEP_3,
  FOOTPRINT_STEP_4,
  FOOTPRINT_STEP_5,
  FOOTPRINT_END,
}
