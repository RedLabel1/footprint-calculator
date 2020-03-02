import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footprint_calculator/footprint/data/model/energy_consumption_ranges.dart';
import 'package:footprint_calculator/footprint/data/model/range.dart';
import 'package:footprint_calculator/footprint/data/network/footprint_provider.dart';
import 'package:footprint_calculator/main.dart';
import 'package:rxdart/rxdart.dart';

class FootprintBloc {
  final FootprintProvider footprintProvider;

  PublishSubject<Range> _selectedEnergyConsumptionRange;

  Stream<EnergyConsumptionRanges> get energyConsumptionRanges => footprintProvider
      .retrieveEnergyConsumptionRanges()
      .transform(_energyConsumptionRangesTransform());

  FootprintBloc({this.footprintProvider}) {
    _selectedEnergyConsumptionRange = PublishSubject<Range>();
  }

  Stream<Range> get selectedEnergyConsumptionRange =>
      _selectedEnergyConsumptionRange.stream;

  set selectEnergyConsumptionRange(Range energyConsumptionRange) =>
      _selectedEnergyConsumptionRange.add(energyConsumptionRange);

  StreamTransformer<QuerySnapshot, EnergyConsumptionRanges> _energyConsumptionRangesTransform() =>
      StreamTransformer<QuerySnapshot, EnergyConsumptionRanges>.fromHandlers(
          handleData: (data, sink) =>
              sink.add(EnergyConsumptionRanges().from(querySnapshot: data).sort()));

  void navigateTo(Routes route, BuildContext context) =>
      Navigator.of(context).pushNamed(routes[route]);

  void endJourney(BuildContext context) =>
      Navigator.of(context).popUntil(ModalRoute.withName(routes[Routes.MAIN]));

  void dispose() => _selectedEnergyConsumptionRange.close();
}
