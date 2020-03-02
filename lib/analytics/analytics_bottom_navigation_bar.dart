import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics.dart';

class AnalyticsBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final FirebaseAnalytics analyticsInstance;
  final ValueChanged<int> onTap;
  final int currentIndex;
  final double elevation;
  final BottomNavigationBarType type;

  Color get fixedColor => selectedItemColor;
  final Color backgroundColor;
  final double iconSize;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final IconThemeData selectedIconTheme;
  final IconThemeData unselectedIconTheme;
  final TextStyle selectedLabelStyle;
  final TextStyle unselectedLabelStyle;
  final double selectedFontSize;
  final double unselectedFontSize;
  final bool showUnselectedLabels;
  final bool showSelectedLabels;

  AnalyticsBottomNavigationBar({
    @required this.items,
    @required this.analyticsInstance,
    this.onTap,
    this.currentIndex = 0,
    this.elevation = 8.0,
    this.type,
    Color fixedColor,
    this.backgroundColor,
    this.iconSize = 24.0,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedIconTheme = const IconThemeData(),
    this.unselectedIconTheme = const IconThemeData(),
    this.selectedFontSize = 14.0,
    this.unselectedFontSize = 12.0,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showSelectedLabels = true,
    this.showUnselectedLabels,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      onTap: (index) => _onAnalyticsBottomNavigationBarItemTapped(index),
      currentIndex: currentIndex,
      elevation: elevation,
      type: type,
      fixedColor: fixedColor,
      backgroundColor: backgroundColor,
      iconSize: iconSize,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
      selectedFontSize: selectedFontSize,
      unselectedFontSize: unselectedFontSize,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
    );
  }

  void _onAnalyticsBottomNavigationBarItemTapped(int index) {
    analyticsInstance.logEvent(
      name: Analytics.ANALYTICS_BOTTOM_NAVIGATION_BAR_ITEM_TAPPED,
      parameters: {
        Analytics.ANALYTICS_PARAMETER_ITEM_NAME:
            Analytics.ANALYTICS_BOTTOM_NAVIGATION_BAR_ITEM_NAME[index]
      },
    );
    onTap(index);
  }
}
