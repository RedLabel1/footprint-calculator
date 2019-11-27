import 'package:flutter/material.dart';
import 'package:footprint_calculator/business/business.dart';
import 'package:footprint_calculator/home/home.dart';
import 'package:footprint_calculator/school/school.dart';
import 'package:rxdart/rxdart.dart';

class MainNavigationBloc {

  List<Destination> destinations;

  BehaviorSubject<Destination> _currentDestination;

  MainNavigationBloc() {
    destinations = <Destination>[
      Destination.home(),
      Destination.business(),
      Destination.school(),
    ];

    _currentDestination = BehaviorSubject<Destination>.seeded(destinations[0]);
  }

  Observable<Destination> get currentDestination => _currentDestination.stream;

  set destination(Destination destination) => _currentDestination.add(destination);

  void dispose() => _currentDestination.close();
}

class Destination {

  BottomNavigationBarItem bottomNavigationBarItem;
  int index;
  Widget child;

  Destination(this.bottomNavigationBarItem, this.index, this.child);

  Destination.from(this.index) {
    switch (index) {
      case 0:
        Destination.home();
        break;
      case 1:
        Destination.business();
        break;
      case 2:
        Destination.school();
    }
  }

  factory Destination.home() => Destination(BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")), 0, Home());

  factory Destination.business() =>
      Destination(BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("Business")), 1, Business());

  factory Destination.school() => Destination(BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("School")), 2, School());
}
