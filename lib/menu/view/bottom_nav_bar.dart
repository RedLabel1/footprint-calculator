import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:provider/provider.dart';

import '../bloc/main_navigation_bloc.dart';

class BottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      initialData: bloc.initialDestination,
      builder: (_, AsyncSnapshot<Destination> snapshot) => _bottomNavigationBar(snapshot.data, bloc),
    );
  }

  BottomNavigationBar _bottomNavigationBar(Destination destination, MainNavigationBloc bloc) =>
      BottomNavigationBar(
        key: bottomNavigationBarKey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: bloc.indexOf(destination),
        items: bloc.bottomNavigationBarItems,
        onTap: (index) => bloc.addDestination(index),
      );
}

final bottomNavigationBarKey = GlobalKey(debugLabel: "bottom_navigation_bar_key");

final bottomNavigationBar = bottomNavigationBarKey.currentWidget as BottomNavigationBar;
