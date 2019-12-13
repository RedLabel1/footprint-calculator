import 'package:flutter/material.dart';
import 'package:footprint_calculator/business/business.dart';
import 'package:footprint_calculator/home/home.dart';
import 'package:footprint_calculator/school/school.dart';
import 'package:footprint_calculator/map/map.dart';

class Destination {

  BottomNavigationBarItem _bottomNavigationBarItem;
  Widget _child;

  get bottomNavigationBarItem => _bottomNavigationBarItem;

  get child => _child;

  Destination(this._bottomNavigationBarItem, this._child);

  factory Destination.home() =>
      Destination(BottomNavigationBarItem(icon: Image.asset("assets/icons/01_huella-48color.png"), title: Text("Home")), Home());

  factory Destination.business() =>
      Destination(BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("Business")), Business());

  factory Destination.school() =>
      Destination(BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("School")), School());

  factory Destination.map() =>
      Destination(BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("Map")), Map());
}
