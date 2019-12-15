import 'package:flutter/material.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:rxdart/rxdart.dart';

class TopNavigationBloc {

  Destination _initialDestination;
  PublishSubject<Destination> _currentDestination;

  TopNavigationBloc() {
    _initialDestination = topDestinations[0];
    _currentDestination = PublishSubject<Destination>();
  }

  Destination get initialDestination => _initialDestination;

  Observable<Destination> get currentDestination => _currentDestination.stream;

  int indexOf(Destination destination) => topDestinations.indexOf(destination);

  get children => topDestinations.map<Widget>((destination) => destination.child).toList();

  get bottomNavigationBarItems => topDestinations.map<BottomNavigationBarItem>((destination) => destination.bottomNavigationBarItem).toList();

  set destination(Destination destination) => _currentDestination.add(destination);

  void addDestination(int index) => _currentDestination.add(topDestinations[index]);

  void dispose() => _currentDestination.close();
}
