import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:provider/provider.dart';

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
        type: BottomNavigationBarType.fixed,
        currentIndex: bloc.indexOf(destination),
        items: bloc.bottomNavigationBarItems,
        onTap: (index) => bloc.addDestination(index),
      );
}

extension on BottomNavigationBar {

  Widget animateCurrentItem() => AnimatedSize(
    duration: Duration(milliseconds: 200),
    child: this.items[this.currentIndex].activeIcon,
    vsync: this.createState(
    ),
  );
}
