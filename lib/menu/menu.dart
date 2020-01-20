import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/bloc/drawer_bloc.dart';
import 'package:footprint_calculator/menu/view/app_bar.dart';
import 'package:footprint_calculator/menu/view/drawer.dart';
import 'package:provider/provider.dart';

import 'view/body.dart';
import 'view/bottom_nav_bar.dart';
import 'bloc/main_navigation_bloc.dart';

MultiProvider footprintCalculator() => MultiProvider(
      providers: [
        Provider<MainNavigationBloc>(create: (_) => MainNavigationBloc(), dispose: (_, bloc) => bloc.dispose()),
        Provider<DrawerBloc>(create: (_) => DrawerBloc()),
      ],
      child: _scaffold(),
    );

Scaffold _scaffold() => Scaffold(
      body: _safeArea(),
      appBar: AgresteAppBar(),
      bottomNavigationBar: BottomNavBar(),
      endDrawer: AgresteDrawer(),
    );

SafeArea _safeArea() => SafeArea(child: Body());
