import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:footprint_calculator/footprint/bloc/footprint_bloc.dart';
import 'package:footprint_calculator/footprint/data/model/energy_consumption_ranges.dart';
import 'package:footprint_calculator/footprint/view/footprint_steps_app_bar.dart';
import 'package:footprint_calculator/generated/l10n.dart';
import 'package:footprint_calculator/main.dart';
import 'package:footprint_calculator/menu/view/drawer.dart';
import 'package:provider/provider.dart';

class FootprintStep2 extends StatelessWidget {
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
            flex: 2,
            child: Image.asset("assets/icons/energy_idle.png",
                height: 46, width: 46, fit: BoxFit.contain)),
        Expanded(
            flex: 3,
            child: Image.asset("assets/icons/transportation_selected.png",
                height: 50, width: 50, fit: BoxFit.contain)),
        Expanded(
            flex: 2,
            child: Image.asset("assets/icons/food_idle.png",
                height: 46, width: 46, fit: BoxFit.contain)),
        Expanded(
            flex: 2,
            child: Image.asset("assets/icons/shopping_idle.png",
                height: 46, width: 46, fit: BoxFit.contain)),
        Expanded(
            flex: 2,
            child: Image.asset("assets/icons/travels_idle.png",
                height: 46, width: 46, fit: BoxFit.contain)),
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
  final EnergyConsumptionRange displayRange, selectedRange;

  _ChoiceChip({this.displayRange, this.selectedRange});

  @override
  Widget build(BuildContext context) {
    FootprintBloc bloc = Provider.of<FootprintBloc>(context);
    return ChoiceChip(
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
    return RaisedButton(
      onPressed: enabled ? () => bloc.navigateTo(Routes.FOOTPRINT_STEP_2, context) : null,
      child: Text(S.of(context).footprint_1_next_button),
    );
  }
}
