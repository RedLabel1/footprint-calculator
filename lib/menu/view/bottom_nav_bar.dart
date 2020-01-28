import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/analytics/analytics_bottom_navigation_bar.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);
    AnalyticsBloc analytics = Provider.of<AnalyticsBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      initialData: bloc.initialDestination,
      builder: (_, AsyncSnapshot<Destination> snapshot) => _bottomNavigationBar(snapshot.data, bloc, analytics),
    );
  }

  AnalyticsBottomNavigationBar _bottomNavigationBar(Destination destination, MainNavigationBloc bloc, AnalyticsBloc analytics) =>
      AnalyticsBottomNavigationBar(
        analyticsComponentName: bloc.analyticsComponentName,
        analyticsInstance: analytics.firebaseAnalytics,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: bloc.indexOf(destination),
        items: bloc.bottomNavigationBarItems,
        onTap: (index) => bloc.addDestination(index),
      );
}
