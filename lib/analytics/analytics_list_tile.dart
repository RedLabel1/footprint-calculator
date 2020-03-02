import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics.dart';

class AnalyticsDrawerListTile extends StatelessWidget {

  final String analyticsComponentName;
  final FirebaseAnalytics analyticsInstance;
  final Widget leading;
  final Text title;
  final Widget subtitle;
  final Widget trailing;
  final bool isThreeLine;
  final bool dense;
  final EdgeInsetsGeometry contentPadding;
  final bool enabled;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;
  final bool selected;

  AnalyticsDrawerListTile({
    @required this.analyticsComponentName,
    @required this.analyticsInstance,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      isThreeLine: isThreeLine,
      dense: dense,
      contentPadding: contentPadding,
      enabled: enabled,
      onTap:  () => _onAnalyticsListTileTapped(),
      onLongPress: onLongPress,
      selected: selected,
    );
  }

  void _onAnalyticsListTileTapped() {
    analyticsInstance.logEvent(
      name: Analytics.ANALYTICS_DRAWER_ITEM_TAPPED,
      parameters: { Analytics.ANALYTICS_PARAMETER_ITEM_NAME : analyticsComponentName },
    );
    onTap();
  }
}
