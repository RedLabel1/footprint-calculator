import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/bloc/bottom_navigation_bloc.dart';
import 'package:footprint_calculator/menu/bloc/top_navigation_bloc.dart';
import 'package:provider/provider.dart';

import 'view/body.dart';
import 'view/bottom_nav_bar.dart';
import 'bloc/main_navigation_bloc.dart';
import 'view/top_nav_bar.dart';

MultiProvider footprintCalculator() =>
    MultiProvider(
      providers: [
        Provider<MainNavigationBloc>(create: (_) => MainNavigationBloc(), dispose: (_, bloc) => bloc.dispose()),
        Provider<TopNavigationBloc>(create: (_) => TopNavigationBloc(), dispose: (_, bloc) => bloc.dispose()),
        Provider<BottomNavigationBloc>(create: (_) => BottomNavigationBloc(), dispose: (_, bloc) => bloc.dispose()),
      ],
      child: _scaffold(),
    );

Scaffold _scaffold() => Scaffold(body: _safeArea(), appBar: TopNavBar(), bottomNavigationBar: BottomNavBar());

SafeArea _safeArea() => SafeArea(child: Body());
