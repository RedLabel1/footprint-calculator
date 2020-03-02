import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/analytics/analytics_floating_action_button.dart';
import 'package:footprint_calculator/footprint/bloc/footprint_bloc.dart';
import 'package:footprint_calculator/generated/l10n.dart';
import 'package:footprint_calculator/main.dart';
import 'package:provider/provider.dart';

class Footprint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //child: _statsPlaceHolder(),
      child: Stack(
        children: <Widget>[
          _StatsPlaceholder(),
          _CalculatorButton(),
        ],
      ),
    );
  }
}

class _CalculatorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FootprintBloc bloc = Provider.of<FootprintBloc>(context);
    AnalyticsBloc analytics = Provider.of<AnalyticsBloc>(context);
    return Positioned(
      child: AnalyticsFloatingActionButton(
        analyticsComponentName: Analytics.ANALYTICS_FOOTPRINT_NEW_CALCULATION,
        analyticsInstance: analytics.firebaseAnalytics,
        onPressed: () => bloc.navigateTo(Routes.FOOTPRINT_STEP_1, context),
        child: Icon(Icons.add),
      ),
      bottom: 16,
      right: 16,
    );
  }
}

class _StatsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/icons/stats.png",
              height: 80.0,
              fit: BoxFit.cover,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).footprint_no_stats,
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
