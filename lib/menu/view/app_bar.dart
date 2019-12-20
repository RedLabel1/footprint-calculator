import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:provider/provider.dart';

class AgresteAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Size _preferredSize = Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      initialData: bloc.initialDestination,
      builder: (_, AsyncSnapshot<Destination> snapshot) => _appBar(snapshot.data),
    );
  }

  @override
  Size get preferredSize => _preferredSize;

  Widget _appBar(Destination destination) =>
      AppBar(
        title: Text(destination.title),
        actions: <Widget>[
          IconButton(icon: Image.asset("assets/icons/profile_idle.png"), onPressed: null),
          IconButton(icon: Icon(Icons.menu), onPressed: null),
        ],
      );
}
