import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:footprint_calculator/footprint/data/model/range.dart';
import 'package:footprint_calculator/generated/l10n.dart';

class EnergyConsumptionRanges {
  final List<Range> ranges;

  EnergyConsumptionRanges({
    this.ranges,
  });
}

extension Mapper on EnergyConsumptionRanges {
  EnergyConsumptionRanges from({QuerySnapshot querySnapshot}) => EnergyConsumptionRanges(
      ranges: querySnapshot.documents
          .map((document) => Range(
                min: document["min"],
                max: document["max"],
              ))
          .toList());
}

extension Sort on EnergyConsumptionRanges {
  EnergyConsumptionRanges sort() {
    ranges.sort((a, b) => a.min.compareTo(b.min));
    return EnergyConsumptionRanges(ranges: ranges);
  }
}

extension Strings on Range {
  String string(BuildContext context) {
    if (this.max != null) {
      return S.of(context).footprint_1_energy_consumption_range(min, max);
    } else {
      return S.of(context).footprint_1_energy_consumption_range_no_max(min);
    }
  }
}
