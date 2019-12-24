import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/bloc/drawer_bloc.dart';
import 'package:provider/provider.dart';

class AgresteDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DrawerBloc bloc = Provider.of<DrawerBloc>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: _drawerHeader(),
          ),
          ListTile(
            title: Text(bloc.footprint.keys.first),
            leading: bloc.footprint.values.first,
            onTap: () => bloc.navigateToFootprint(context),
          ),
          ListTile(
            title: Text(bloc.tips.keys.first),
            leading: bloc.tips.values.first,
            onTap: () => bloc.navigateToTips(context),
          ),
          ListTile(
            title: Text(bloc.game.keys.first),
            leading: bloc.game.values.first,
            onTap: () => bloc.navigateToGame(context),
          ),
          ListTile(
            title: Text(bloc.shop.keys.first),
            leading: bloc.shop.values.first,
            onTap: () => bloc.navigateToShop(context),
          ),
          ListTile(
            title: Text(bloc.profile.keys.first),
            leading: bloc.profile.values.first,
            onTap: () => bloc.navigateToProfile(context),
          ),
          ListTile(
            title: Text(bloc.about.keys.first),
            leading: bloc.about.values.first,
            onTap: () => bloc.navigateToAbout(context),
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader() =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Container(
            child: Image.asset(
              "assets/icons/logo.png",
              height: 80.0,
              fit: BoxFit.cover,
        ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Fundación Agreste"),
        ),
      ],
    );
