import 'package:flutter/material.dart';
import 'package:footprint_calculator/about/about.dart';
import 'package:footprint_calculator/footprint/bloc/footprint_bloc.dart';
import 'package:footprint_calculator/menu/bloc/drawer_bloc.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:footprint_calculator/menu/view/app_bar.dart';
import 'package:footprint_calculator/menu/view/body.dart';
import 'package:footprint_calculator/menu/view/bottom_nav_bar.dart';
import 'package:footprint_calculator/menu/view/drawer.dart';
import 'package:footprint_calculator/profile/profile.dart';
import 'package:provider/provider.dart';

void main() => runApp(footprintCalculator());

MultiProvider footprintCalculator() => MultiProvider(
  providers: [
    Provider<MainNavigationBloc>(create: (_) => MainNavigationBloc(), dispose: (_, bloc) => bloc.dispose()),
    Provider<FootprintBloc>(create: (_) => FootprintBloc()),
    Provider<DrawerBloc>(create: (_) => DrawerBloc()),
  ],
  child: MaterialApp(
    initialRoute: "/",
    routes: {
      routes[Routes.MAIN] : (_) => _scaffold(),
      routes[Routes.PROFILE] : (_) => Profile(),
      routes[Routes.ABOUT] : (_) => About(),
    },
  ),
);

Scaffold _scaffold() => Scaffold(
  body: _safeArea(),
  appBar: AgresteAppBar(),
  bottomNavigationBar: BottomNavBar(),
  endDrawer: AgresteDrawer(),
);

SafeArea _safeArea() => SafeArea(child: Body());

const routes = {
  Routes.MAIN : "/",
  Routes.PROFILE : "/profile",
  Routes.ABOUT : "/about",
};

enum Routes { MAIN, PROFILE, ABOUT }
