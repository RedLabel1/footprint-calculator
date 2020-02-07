import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/analytics/analytics_bottom_navigation_bar.dart';
import 'package:footprint_calculator/menu/bloc/main_navigation_bloc.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainNavigationBloc bloc = Provider.of<MainNavigationBloc>(context);
    AnalyticsBloc analytics = Provider.of<AnalyticsBloc>(context);

    return StreamBuilder(
      stream: bloc.currentDestination,
      initialData: bloc.initialDestination,
      builder: (_, AsyncSnapshot<int> snapshot) =>
          _bottomNavigationBar(context, snapshot.data, bloc, analytics),
    );
  }

  AnalyticsBottomNavigationBar _bottomNavigationBar(BuildContext context, int destination,
          MainNavigationBloc bloc, AnalyticsBloc analytics) =>
      AnalyticsBottomNavigationBar(
        analyticsInstance: analytics.firebaseAnalytics,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: destination,
        items: _bottomNavigationBarItems(context, bloc),
        onTap: (index) => bloc.destination = index,
      );

  List<BottomNavigationBarItem> _bottomNavigationBarItems(
          BuildContext context, MainNavigationBloc bloc) =>
      [
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/footprint_idle.png"),
            activeIcon: Image.asset("assets/icons/footprint_selected.png"),
            title: Text(bloc.destinations(context)[0])),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/tips_idle.png"),
            activeIcon: Image.asset("assets/icons/tips_selected.png"),
            title: Text(bloc.destinations(context)[1])),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/game_idle.png"),
            activeIcon: Image.asset("assets/icons/game_selected.png"),
            title: Text(bloc.destinations(context)[2])),
        BottomNavigationBarItem(
            icon: Image.asset("assets/icons/shop_idle.png"),
            activeIcon: Image.asset("assets/icons/shop_selected.png"),
            title: Text(bloc.destinations(context)[3])),
      ];
}
