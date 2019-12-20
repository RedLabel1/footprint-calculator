import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/view/app_bar.dart';
import 'package:provider/provider.dart';

import 'view/body.dart';
import 'view/bottom_nav_bar.dart';
import 'bloc/main_navigation_bloc.dart';

Provider footprintCalculator() =>
    Provider<MainNavigationBloc>(
      create: (_) => MainNavigationBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: _Menu(),
    );

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);

    return _scaffold(bloc);
  }
}

Scaffold _scaffold(MainNavigationBloc bloc) =>
    Scaffold(body: _safeArea(), appBar: AgresteAppBar(bloc: bloc), bottomNavigationBar: BottomNavBar(bloc: bloc));

SafeArea _safeArea() => SafeArea(child: Body());
