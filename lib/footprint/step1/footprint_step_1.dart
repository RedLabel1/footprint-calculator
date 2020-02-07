import 'package:flutter/material.dart';
import 'package:footprint_calculator/footprint/view/footprint_steps_app_bar.dart';
import 'package:footprint_calculator/menu/view/drawer.dart';

class FootprintStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _safeArea(),
      appBar: FootprintStepsAppBar(),
      endDrawer: AgresteDrawer(),
    );
  }

  SafeArea _safeArea() => SafeArea(child: Container());
}
