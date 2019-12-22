import 'package:flutter/material.dart';
import 'package:footprint_calculator/about/about.dart';
import 'package:footprint_calculator/menu/menu.dart';
import 'package:footprint_calculator/profile/profile.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    routes[Routes.MAIN] : (_) => footprintCalculator(),
    routes[Routes.PROFILE] : (_) => Profile(),
    routes[Routes.ABOUT] : (_) => About(),
  },
));

const routes = {
  Routes.MAIN : "/",
  Routes.PROFILE : "/profile",
  Routes.ABOUT : "/about",
};

enum Routes { MAIN, PROFILE, ABOUT }
