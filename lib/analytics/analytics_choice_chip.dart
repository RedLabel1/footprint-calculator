import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics.dart';
import 'package:footprint_calculator/footprint/data/model/energy_consumption_ranges.dart';
import 'package:footprint_calculator/footprint/data/model/range.dart';

class AnalyticsChoiceChip extends StatelessWidget {
  final Widget label;
  final bool selected;
  final Range range;
  final String analyticsComponentName;
  final FirebaseAnalytics analyticsInstance;
  final Widget avatar;
  final TextStyle labelStyle;
  final EdgeInsetsGeometry labelPadding;
  final ValueChanged<bool> onSelected;
  final double pressElevation;
  final Color disabledColor;
  final Color selectedColor;
  final String tooltip;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final bool autofocus;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final VisualDensity visualDensity;
  final MaterialTapTargetSize materialTapTargetSize;
  final double elevation;
  final Color shadowColor;
  final Color selectedShadowColor;
  final ShapeBorder avatarBorder;

  AnalyticsChoiceChip({
    @required this.label,
    @required this.selected,
    @required this.range,
    @required this.analyticsComponentName,
    @required this.analyticsInstance,
    this.avatar,
    this.labelStyle,
    this.labelPadding,
    this.onSelected,
    this.pressElevation,
    this.selectedColor,
    this.disabledColor,
    this.tooltip,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.backgroundColor,
    this.padding,
    this.visualDensity,
    this.materialTapTargetSize,
    this.elevation,
    this.shadowColor,
    this.selectedShadowColor,
    this.avatarBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: label,
      selected: selected,
      avatar: avatar,
      labelStyle: labelStyle,
      labelPadding: labelPadding,
      onSelected: _onAnalyticsChoiceChipTapped,
      pressElevation: pressElevation,
      tooltip: tooltip,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      disabledColor: disabledColor,
      selectedColor: selectedColor,
      backgroundColor: backgroundColor,
      padding: padding,
      visualDensity: visualDensity,
      materialTapTargetSize: materialTapTargetSize,
      elevation: elevation,
      shadowColor: shadowColor,
      selectedShadowColor: selectedShadowColor,
      avatarBorder: avatarBorder,
    );
  }

  void _onAnalyticsChoiceChipTapped(bool selected) {
    analyticsInstance.logEvent(
      name: Analytics.ANALYTICS_CHOICE_CHIP_TAPPED,
      parameters: {
        Analytics.ANALYTICS_PARAMETER_ITEM_NAME: analyticsComponentName,
        Analytics.ANALYTICS_RANGE_MIN_VALUE: range.min,
        Analytics.ANALYTICS_RANGE_MAX_VALUE:
            range.max == null ? Analytics.ANALYTICS_RANGE_NO_MAX_VALUE : range.max
      },
    );
    onSelected(selected);
  }
}
