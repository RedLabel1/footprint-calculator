import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_navigation_bloc.dart';

Scaffold menuScaffold() => Scaffold(body: _safeArea(), bottomNavigationBar: _BottomNavBar());

SafeArea _safeArea() => SafeArea(child: _Body());

class _Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      builder: (_, AsyncSnapshot<Destination> snapshot) => _indexedStack(snapshot.data, bloc.destinations),
    );
  }

  IndexedStack _indexedStack(Destination destination, List<Destination> destinations) =>
      IndexedStack(
        index: destination.index,
        children: destinations.map<Widget>((destination) => destination.child).toList(),
      );
}

class _BottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      builder: (_, AsyncSnapshot<Destination> snapshot) => _bottomNavigationBar(snapshot.data, bloc),
    );
  }

  BottomNavigationBar _bottomNavigationBar(Destination destination, MainNavigationBloc bloc) =>
      BottomNavigationBar(
        currentIndex: destination.index,
        items: bloc.destinations.map<BottomNavigationBarItem>((destination) => destination.bottomNavigationBarItem).toList(),
        onTap: (index) => bloc.destination = Destination.from(index),
      );
}
