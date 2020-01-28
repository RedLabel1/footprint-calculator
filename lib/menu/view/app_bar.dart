import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics_app_bar.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/main.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:provider/provider.dart';

class AgresteAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Size _preferredSize = Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);
    AnalyticsBloc analytics = Provider.of<AnalyticsBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      initialData: bloc.initialDestination,
      builder: (_, AsyncSnapshot<Destination> snapshot) => _appBar(snapshot.data, context, bloc, analytics),
    );
  }

  @override
  Size get preferredSize => _preferredSize;

  Widget _appBar(Destination destination, BuildContext context, MainNavigationBloc bloc, AnalyticsBloc analytics) =>
      AppBar(
        title: Text(destination.title),
        actions: <Widget>[
          AnalyticsAppBarIconButton(
              analyticsComponentName: bloc.analyticsComponentName,
              analyticsInstance: analytics.firebaseAnalytics,
              icon: Image.asset("assets/icons/profile_idle.png"),
              onPressed: () => _navigateToProfile(context),
              tooltip: "Profile"),
          AnalyticsAppBarIconButton(
              analyticsComponentName: bloc.analyticsComponentName,
              analyticsInstance: analytics.firebaseAnalytics,
              icon: Icon(Icons.menu, color: Colors.white,),
              onPressed: () => _openEndDrawer(context),
              tooltip: "Menu"),
        ],
      );
}

void _navigateToProfile(BuildContext context) => Navigator.of(context).pushNamed(routes[Routes.PROFILE]);

void _openEndDrawer(BuildContext context) => Scaffold.of(context).openEndDrawer();
