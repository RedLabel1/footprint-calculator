import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      initialData: bloc.initialDestination,
      builder: (_, AsyncSnapshot<Destination> snapshot) => _indexedStack(snapshot.data, bloc),
    );
  }

  IndexedStack _indexedStack(Destination destination, MainNavigationBloc bloc) =>
      IndexedStack(
        index: bloc.indexOf(destination),
        children: bloc.children,
      );
}
