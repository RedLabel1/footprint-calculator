import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics.dart';
import 'package:footprint_calculator/analytics/analytics_app_bar_icon_button.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/generated/l10n.dart';
import 'package:footprint_calculator/main.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size _preferredSize = Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);
    AnalyticsBloc analytics = Provider.of<AnalyticsBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      initialData: bloc.initialDestination,
      builder: (_, AsyncSnapshot<int> snapshot) => _appBar(snapshot.data, context, bloc, analytics),
    );
  }

  @override
  Size get preferredSize => _preferredSize;

  Widget _appBar(int destination, BuildContext context, MainNavigationBloc bloc,
          AnalyticsBloc analytics) =>
      AppBar(
        title: Text(bloc.destinations(context)[destination]),
        actions: <Widget>[
          AnalyticsAppBarIconButton(
              analyticsComponentName: Analytics.ANALYTICS_APP_BAR_PROFILE_ITEM,
              analyticsInstance: analytics.firebaseAnalytics,
              icon: Image.asset("assets/icons/profile_idle.png"),
              onPressed: () => _navigateToProfile(context),
              tooltip: S.of(context).screen_name_profile),
          AnalyticsAppBarIconButton(
              analyticsComponentName: Analytics.ANALYTICS_APP_BAR_MENU_ITEM,
              analyticsInstance: analytics.firebaseAnalytics,
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => _openEndDrawer(context),
              tooltip: S.of(context).menu_tooltip),
        ],
      );
}

void _navigateToProfile(BuildContext context) =>
    Navigator.of(context).pushNamed(routes[Routes.PROFILE]);

void _openEndDrawer(BuildContext context) => Scaffold.of(context).openEndDrawer();
