import 'package:flutter/material.dart';
import 'package:footprint_calculator/footprint/view/footprint.dart';
import 'package:footprint_calculator/game/game.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:footprint_calculator/shop/shop.dart';
import 'package:footprint_calculator/tips/tips.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      initialData: bloc.initialDestination,
      builder: (_, AsyncSnapshot<int> snapshot) => _indexedStack(snapshot.data, bloc),
    );
  }

  IndexedStack _indexedStack(int destination, MainNavigationBloc bloc) => IndexedStack(
        index: destination,
        children: [
          Footprint(),
          Tips(),
          Game(),
          Shop(),
        ],
      );
}
