import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/analytics/analytics_list_tile.dart';
import 'package:footprint_calculator/generated/l10n.dart';
import 'package:footprint_calculator/menu/bloc/drawer_bloc.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:provider/provider.dart';

class AgresteDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DrawerBloc bloc = Provider.of<DrawerBloc>(context);
    MainNavigationBloc navigation = Provider.of<MainNavigationBloc>(context);
    AnalyticsBloc analytics = Provider.of<AnalyticsBloc>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: _drawerHeader(context),
          ),
          AnalyticsDrawerListTile(
            analyticsComponentName: Analytics.ANALYTICS_DRAWER_FOOTPRINT_ITEM,
            analyticsInstance: analytics.firebaseAnalytics,
            title: Text(bloc.footprint(context).keys.first),
            leading: bloc.footprint(context).values.first,
            onTap: () => bloc.navigateToMainDestination(() => navigation.destination = 0, context),
          ),
          AnalyticsDrawerListTile(
            analyticsComponentName: Analytics.ANALYTICS_DRAWER_TIPS_ITEM,
            analyticsInstance: analytics.firebaseAnalytics,
            title: Text(bloc.tips(context).keys.first),
            leading: bloc.tips(context).values.first,
            onTap: () => bloc.navigateToMainDestination(() => navigation.destination = 1, context),
          ),
          AnalyticsDrawerListTile(
            analyticsComponentName: Analytics.ANALYTICS_DRAWER_GAME_ITEM,
            analyticsInstance: analytics.firebaseAnalytics,
            title: Text(bloc.game(context).keys.first),
            leading: bloc.game(context).values.first,
            onTap: () => bloc.navigateToMainDestination(() => navigation.destination = 2, context),
          ),
          AnalyticsDrawerListTile(
            analyticsComponentName: Analytics.ANALYTICS_DRAWER_SHOP_ITEM,
            analyticsInstance: analytics.firebaseAnalytics,
            title: Text(bloc.shop(context).keys.first),
            leading: bloc.shop(context).values.first,
            onTap: () => bloc.navigateToMainDestination(() => navigation.destination = 3, context),
          ),
          AnalyticsDrawerListTile(
            analyticsComponentName: Analytics.ANALYTICS_DRAWER_PROFILE_ITEM,
            analyticsInstance: analytics.firebaseAnalytics,
            title: Text(bloc.profile(context).keys.first),
            leading: bloc.profile(context).values.first,
            onTap: () => bloc.navigateToProfile(context),
          ),
          AnalyticsDrawerListTile(
            analyticsComponentName: Analytics.ANALYTICS_DRAWER_ABOUT_ITEM,
            analyticsInstance: analytics.firebaseAnalytics,
            title: Text(bloc.about(context).keys.first),
            leading: bloc.about(context).values.first,
            onTap: () => bloc.navigateToAbout(context),
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader(BuildContext context) =>
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
          child: Text(S.of(context).company_name),
        ),
      ],
    );
