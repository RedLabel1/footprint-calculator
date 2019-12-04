import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/body.dart';
import 'view/bottom_nav_bar.dart';
import 'bloc/main_navigation_bloc.dart';
import 'view/top_nav_bar.dart';

Provider footprintCalculator() =>
    Provider<MainNavigationBloc>(
      create: (_) => MainNavigationBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: _scaffold(),
    );

Scaffold _scaffold() => Scaffold(body: _safeArea(), appBar: TopNavBar(), bottomNavigationBar: BottomNavBar());

SafeArea _safeArea() => SafeArea(child: Body());
