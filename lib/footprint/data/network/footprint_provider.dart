import 'package:cloud_firestore/cloud_firestore.dart';

class FootprintProvider {

  Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> retrieveEnergyConsumptionRanges() {
    return _firestore.collection("energy_consumption_ranges").snapshots();
  }
}
