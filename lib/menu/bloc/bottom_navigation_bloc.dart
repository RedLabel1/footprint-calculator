import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:rxdart/rxdart.dart';

class BottomNavigationBloc {

  Destination _initialDestination;
  PublishSubject<Destination> _currentDestination;

  BottomNavigationBloc() {
    _initialDestination = bottomDestinations[0];
    _currentDestination = PublishSubject<Destination>();
  }

  Destination get initialDestination => _initialDestination;

  Observable<Destination> get currentDestination => _currentDestination.stream;

  int indexOf(Destination destination) => bottomDestinations.indexOf(destination);

  get children => bottomDestinations.map<Widget>((destination) => destination.child).toList();

  get bottomNavigationBarItems => bottomDestinations.map<BottomNavigationBarItem>((destination) => destination.bottomNavigationBarItem).toList();

  set destination(Destination destination) => _currentDestination.add(destination);

  void addDestination(int index) => _currentDestination.add(bottomDestinations[index]);

  void dispose() => _currentDestination.close();
}
