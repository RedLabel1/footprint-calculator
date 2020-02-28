import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics_app_bar_icon_button.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/footprint/bloc/footprint_bloc.dart';
import 'package:provider/provider.dart';

class FootprintStepsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size _preferredSize = Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    FootprintBloc bloc = Provider.of<FootprintBloc>(context);
    AnalyticsBloc analytics = Provider.of<AnalyticsBloc>(context);

    return _appBar(context, bloc, analytics);
  }

  Widget _appBar(BuildContext context, FootprintBloc bloc, AnalyticsBloc analytics) =>
      AppBar(
        actions: <Widget>[
          AnalyticsAppBarIconButton(
              analyticsInstance: analytics.firebaseAnalytics,
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () => bloc.endJourney(context),
              tooltip: "CLOSE"),
        ],
      );

  @override
  Size get preferredSize => _preferredSize;
}
