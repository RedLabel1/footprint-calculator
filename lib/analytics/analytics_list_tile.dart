import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AnalyticsDrawerListTile extends StatelessWidget {

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
      onTap:  () => onAnalyticsListTileTapped(title),
      onLongPress: onLongPress,
      selected: selected,
    );
  }

  void onAnalyticsListTileTapped(Text textWidget) {
    analyticsInstance.logEvent(
      name: "drawer_item_tapped",
      parameters: { "item_name" : textWidget.data },
    );
    onTap();
  }
}
