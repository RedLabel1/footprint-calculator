import 'package:flutter/material.dart';
import 'package:footprint_calculator/main.dart';

class FootprintBloc {

  void navigateToFootprintStep1(BuildContext context) =>
      Navigator.of(context).popAndPushNamed(routes[Routes.ABOUT]);
}
