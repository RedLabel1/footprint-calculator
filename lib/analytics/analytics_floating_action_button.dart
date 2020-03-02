import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics.dart';

class AnalyticsFloatingActionButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String analyticsComponentName;
  final FirebaseAnalytics analyticsInstance;
  final Widget child;
  final String tooltip;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color focusColor;
  final Color hoverColor;
  final Color splashColor;
  final Object heroTag;
  final double elevation;
  final double focusElevation;
  final double hoverElevation;
  final double highlightElevation;
  final double disabledElevation;
  final bool mini;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final bool autofocus;
  final bool isExtended = false;
  final MaterialTapTargetSize materialTapTargetSize;

  AnalyticsFloatingActionButton({
    @required this.onPressed,
    @required this.analyticsComponentName,
    @required this.analyticsInstance,
    this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.mini = false,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onAnalyticsFloatingActionButtonTapped,
      child: child,
      tooltip: tooltip,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      heroTag: heroTag,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      mini: mini,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      materialTapTargetSize: materialTapTargetSize,
    );
  }

  void _onAnalyticsFloatingActionButtonTapped() {
    analyticsInstance.logEvent(
      name: Analytics.ANALYTICS_BUTTON_TAPPED,
      parameters: { Analytics.ANALYTICS_PARAMETER_ITEM_NAME: analyticsComponentName},
    );
    onPressed();
  }
}

class _DefaultHeroTag {
  const _DefaultHeroTag();

  @override
  String toString() => '<default FloatingActionButton tag>';
}
