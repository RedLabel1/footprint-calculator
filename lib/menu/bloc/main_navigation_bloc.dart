import 'package:flutter/material.dart';
import 'package:footprint_calculator/analytics/analytics.dart';
import 'package:footprint_calculator/menu/model/destination.dart';
import 'package:rxdart/rxdart.dart';

class MainNavigationBloc implements Analytics {
  Destination _initialDestination;
  PublishSubject<Destination> _currentDestination;

  MainNavigationBloc() {
    _initialDestination = destinations[0];
    _currentDestination = PublishSubject<Destination>();
  }

  @override
  String get analyticsComponentName => "main_navigation";

  Destination get initialDestination => _initialDestination;

  Observable<Destination> get currentDestination => _currentDestination.stream;

  int indexOf(Destination destination) => destinations.indexOf(destination);

  get children => destinations.map<Widget>((destination) => destination.child).toList();

  get bottomNavigationBarItems => destinations
      .map<BottomNavigationBarItem>((destination) => destination.bottomNavigationBarItem)
      .toList();

  set destination(Destination destination) => _currentDestination.add(destination);

  void addDestination(int index) => _currentDestination.add(destinations[index]);

  void dispose() => _currentDestination.close();
}
