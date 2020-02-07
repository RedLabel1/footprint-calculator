import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AnalyticsAppBarIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final FirebaseAnalytics analyticsInstance;
  final double iconSize;
  final VisualDensity visualDensity;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final Color focusColor;
  final Color hoverColor;
  final Color color;
  final Color splashColor;
  final Color highlightColor;
  final Color disabledColor;
  final FocusNode focusNode;
  final bool autofocus;
  final String tooltip;
  final bool enableFeedback;
  final BoxConstraints constraints;

  AnalyticsAppBarIconButton({
    @required this.icon,
    @required this.onPressed,
    @required this.analyticsInstance,
    this.iconSize = 24.0,
    this.visualDensity,
    this.padding = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback = true,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () => onAnalyticsAppBarIconPressed(tooltip),
      iconSize: iconSize,
      visualDensity: visualDensity,
      padding: padding,
      alignment: alignment,
      color: color,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      disabledColor: disabledColor,
      focusNode: focusNode,
      autofocus: autofocus,
      tooltip: tooltip,
      enableFeedback: enableFeedback,
      constraints: constraints,
    );
  }

  void onAnalyticsAppBarIconPressed(String name) {
    analyticsInstance.logEvent(
      name: "app_bar_item_tapped",
      parameters: {"item_name": name},
    );
    onPressed();
  }
}
