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
      child: _scaffold(),
    );

Scaffold _scaffold() =>
    Scaffold(body: _safeArea(), appBar: AgresteAppBar(), bottomNavigationBar: BottomNavBar());

SafeArea _safeArea() => SafeArea(child: Body());
