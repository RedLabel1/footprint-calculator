import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:rxdart/rxdart.dart';

class MainNavigationBloc {

  List<Destination> _destinations;
  Destination _initialDestination;
  PublishSubject<Destination> _currentDestination;

  MainNavigationBloc() {
    _destinations = <Destination>[
      Destination.footprint(),
      Destination.stats(),
      Destination.tips(),
      Destination.news(),
      Destination.profile(),
    ];

    _initialDestination = _destinations[0];
    _currentDestination = PublishSubject<Destination>();
  }

  Destination get initialDestination => _initialDestination;

  Observable<Destination> get currentDestination => _currentDestination.stream;

  int indexOf(Destination destination) => _destinations.indexOf(destination);

  get children => _destinations.map<Widget>((destination) => destination.child).toList();

  get bottomNavigationBarItems => _destinations.map<BottomNavigationBarItem>((destination) => destination.bottomNavigationBarItem).toList();

  set destination(Destination destination) => _currentDestination.add(destination);

  void addDestination(int index) => _currentDestination.add(_destinations[index]);

  void dispose() => _currentDestination.close();
}
