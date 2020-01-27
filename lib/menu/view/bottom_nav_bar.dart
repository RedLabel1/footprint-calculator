import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:provider/provider.dart';

import '../bloc/main_navigation_bloc.dart';

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

  BottomNavigationBar _bottomNavigationBar(Destination destination, MainNavigationBloc bloc, AnalyticsBloc analytics) =>
      BottomNavigationBar(
        key: bottomNavigationBarKey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: bloc.indexOf(destination),
        items: bloc.bottomNavigationBarItems,
        onTap: (index) => onBottomNavigationBarItemTapped(bloc, analytics, index),
      );

  void onBottomNavigationBarItemTapped(MainNavigationBloc bloc, AnalyticsBloc analytics, int index) {
    analytics.logEvent(
      eventName: "bottom_navigation_bar_item_tapped",
      parameters: {
        "component_name" : bloc.analyticsComponentName,
        "index" : index,
      },
    );
    bloc.addDestination(index);
  }
}

final bottomNavigationBarKey = GlobalKey(debugLabel: "bottom_navigation_bar_key");

final bottomNavigationBar = bottomNavigationBarKey.currentWidget as BottomNavigationBar;
