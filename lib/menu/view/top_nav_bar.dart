import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:provider/provider.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      initialData: bloc.initialDestination,
      builder: (_, AsyncSnapshot<Destination> snapshot) => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: _topNavigationBar(snapshot.data, bloc),
      ),
    );
  }

  BottomNavigationBar _topNavigationBar(Destination destination, MainNavigationBloc bloc) =>
      BottomNavigationBar(
        elevation: 2,
        currentIndex: bloc.indexOf(destination),
        items: bloc.bottomNavigationBarItems,
        onTap: (index) => bloc.addDestination(index),
      );

  @override
  Size get preferredSize => Size.fromHeight(54.0);
}
