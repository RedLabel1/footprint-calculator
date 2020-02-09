import 'package:flutter/material.dart';
import 'package:footprint_calculator/common/Heroes.dart';
import 'package:footprint_calculator/footprint/view/footprint_steps_app_bar.dart';
import 'package:footprint_calculator/menu/view/drawer.dart';

class FootprintStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _Background(),
        Scaffold(
          body: _safeArea(),
          appBar: FootprintStepsAppBar(),
          endDrawer: AgresteDrawer(),
        ),
      ],
    );
  }

  SafeArea _safeArea() => SafeArea(child: Container());
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Heroes.APPBAR_TO_BACKGROUND,
      child: Container(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
