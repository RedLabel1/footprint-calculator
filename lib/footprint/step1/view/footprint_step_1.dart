import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:footprint_calculator/analytics/analytics.dart';
import 'package:footprint_calculator/analytics/analytics_bloc.dart';
import 'package:footprint_calculator/analytics/analytics_choice_chip.dart';
import 'package:footprint_calculator/analytics/analytics_raised_button.dart';
import 'package:footprint_calculator/common/heroes.dart';
import 'package:footprint_calculator/footprint/bloc/footprint_bloc.dart';
import 'package:footprint_calculator/footprint/data/model/energy_consumption_ranges.dart';
import 'package:footprint_calculator/footprint/data/model/range.dart';
import 'package:footprint_calculator/footprint/view/footprint_steps_app_bar.dart';
import 'package:footprint_calculator/generated/l10n.dart';
import 'package:footprint_calculator/main.dart';
import 'package:footprint_calculator/menu/view/drawer.dart';
import 'package:provider/provider.dart';

class FootprintStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: FootprintStepsAppBar(),
          endDrawer: AgresteDrawer(),
          body:
              Padding(padding: EdgeInsets.symmetric(vertical: 60, horizontal: 24), child: _Body()),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(children: <Widget>[
          _TopIcons(),
          Padding(padding: EdgeInsets.all(32)),
          _Form(),
        ]),
        _Next(),
      ],
    );
  }
}

class _TopIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Hero(
            tag: Heroes.FOOTPRINT_TOP_ICON_ENERGY,
            child: Image.asset("assets/icons/energy_selected.png",
                height: 50, width: 50, fit: BoxFit.contain),
          ),
        ),
        Expanded(
          flex: 2,
          child: Hero(
            tag: Heroes.FOOTPRINT_TOP_ICON_TRANSPORTATION,
            child: Image.asset("assets/icons/transportation_idle.png",
                height: 46, width: 46, fit: BoxFit.contain),
          ),
        ),
        Expanded(
          flex: 2,
          child: Hero(
            tag: Heroes.FOOTPRINT_TOP_ICON_FOOD,
            child: Image.asset("assets/icons/food_idle.png",
                height: 46, width: 46, fit: BoxFit.contain),
          ),
        ),
        Expanded(
          flex: 2,
          child: Hero(
            tag: Heroes.FOOTPRINT_TOP_ICON_SHOPPING,
            child: Image.asset("assets/icons/shopping_idle.png",
                height: 46, width: 46, fit: BoxFit.contain),
          ),
        ),
        Expanded(
          flex: 2,
          child: Hero(
            tag: Heroes.FOOTPRINT_TOP_ICON_TRAVELS,
            child: Image.asset("assets/icons/travels_idle.png",
                height: 46, width: 46, fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _Title(),
        Padding(padding: EdgeInsets.all(8)),
        _Choices(),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(S.of(context).footprint_1_title,
        style: Theme.of(context).primaryTextTheme.headline1);
  }
}

class _Choices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FootprintBloc bloc = Provider.of<FootprintBloc>(context);
    return StreamBuilder(
      stream: bloc.energyConsumptionRanges,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return _Placeholder();
        } else {
          return _BuildChoiceList(energyConsumptionRanges: snapshot.data);
        }
      },
    );
  }
}

class _BuildChoiceList extends StatelessWidget {
  final EnergyConsumptionRanges energyConsumptionRanges;

  _BuildChoiceList({this.energyConsumptionRanges});

  @override
  Widget build(BuildContext context) {
    FootprintBloc bloc = Provider.of<FootprintBloc>(context);
    List<Widget> choices = List();
    energyConsumptionRanges.ranges.forEach((range) {
      choices.add(Container(
        padding: const EdgeInsets.only(right: 8),
        child: StreamBuilder(
          stream: bloc.selectedEnergyConsumptionRange,
          builder: (context, snapshot) =>
              _ChoiceChip(displayRange: range, selectedRange: snapshot.data),
        ),
      ));
    });
    return Wrap(children: choices);
  }
}

class _ChoiceChip extends StatelessWidget {
  final Range displayRange, selectedRange;

  _ChoiceChip({this.displayRange, this.selectedRange});

  @override
  Widget build(BuildContext context) {
    FootprintBloc bloc = Provider.of<FootprintBloc>(context);
    AnalyticsBloc analytics = Provider.of<AnalyticsBloc>(context);
    return AnalyticsChoiceChip(
      range: displayRange,
      analyticsComponentName: Analytics.ANALYTICS_CONSUMPTION_RANGE_CHOICE_CHIP_NAME,
      analyticsInstance: analytics.firebaseAnalytics,
      label: Text(displayRange.string(context)),
      selected: displayRange == selectedRange,
      onSelected: (bool) => bloc.selectEnergyConsumptionRange = displayRange,
    );
  }
}

class _Placeholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Wrap(
        children: <Widget>[_DummyChoiceChip(), _DummyChoiceChip(), _DummyChoiceChip()],
      );
}

class _DummyChoiceChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(right: 8),
        child: ChoiceChip(
          label: Container(
            width: 100,
          ),
          selected: false,
        ),
      );
}

class _Next extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FootprintBloc bloc = Provider.of<FootprintBloc>(context);
    return StreamBuilder(
      stream: bloc.selectedEnergyConsumptionRange,
      builder: (context, snapshot) => _NextButton(enabled: snapshot.data != null),
    );
  }
}

class _NextButton extends StatelessWidget {
  final bool enabled;

  _NextButton({this.enabled});

  @override
  Widget build(BuildContext context) {
    FootprintBloc bloc = Provider.of<FootprintBloc>(context);
    AnalyticsBloc analytics = Provider.of<AnalyticsBloc>(context);
    return Hero(
      tag: Heroes.FOOTPRINT_NEXT_BUTTON,
      child: AnalyticsRaisedButton(
        analyticsComponentName: Analytics.ANALYTICS_FOOTPRINT_STEP_1_NEXT_BUTTON,
        enabled: enabled,
        analyticsInstance: analytics.firebaseAnalytics,
        onPressed: () => bloc.navigateTo(Routes.FOOTPRINT_STEP_2, context),
        child: Text(S.of(context).footprint_next_button),
      ),
    );
  }
}
