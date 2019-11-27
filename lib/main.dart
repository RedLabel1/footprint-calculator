import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu.dart';
import 'package:provider/provider.dart';

import 'main_navigation_bloc.dart';

void main() => runApp(MaterialApp(home: FootprintCalculator(),));

class FootprintCalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider<MainNavigationBloc>(
      builder: (_) => MainNavigationBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: menuScaffold(),
    );
  }
}
