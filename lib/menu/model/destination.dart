import 'package:flutter/material.dart';
import 'package:footprint_calculator/game/game.dart';
import 'package:footprint_calculator/profile/profile.dart';
import 'package:footprint_calculator/stats/stats.dart';
import 'package:footprint_calculator/footprint/footprint.dart';
import 'package:footprint_calculator/tips/tips.dart';
import 'package:footprint_calculator/news/news.dart';

class Destination {

  final BottomNavigationBarItem _bottomNavigationBarItem;
  final Widget _child;

  get bottomNavigationBarItem => _bottomNavigationBarItem;

  get child => _child;

  Destination(this._bottomNavigationBarItem, this._child);

  factory Destination.footprint() =>
      Destination(BottomNavigationBarItem(
        icon: Image.asset("assets/icons/footprint_idle.png"),
        activeIcon: Image.asset("assets/icons/footprint_selected.png"),
        title: Text("")
      ), Footprint());

  factory Destination.stats() =>
      Destination(BottomNavigationBarItem(
          icon: Image.asset("assets/icons/stats_idle.png"),
          activeIcon: Image.asset("assets/icons/stats_selected.png"),
          title: Text("")
      ), Stats());

  factory Destination.tips() =>
      Destination(BottomNavigationBarItem(
          icon: Image.asset("assets/icons/tips_idle.png"),
          activeIcon: Image.asset("assets/icons/tips_selected.png"),
          title: Text("")
      ), Tips());

  factory Destination.news() =>
      Destination(BottomNavigationBarItem(
          icon: Image.asset("assets/icons/news_idle.png"),
          activeIcon: Image.asset("assets/icons/news_selected.png"),
          title: Text("")
      ), News());

  factory Destination.profile() =>
      Destination(BottomNavigationBarItem(
          icon: Image.asset("assets/icons/profile_idle.png"),
          activeIcon: Image.asset("assets/icons/profile_selected.png"),
          title: Text("")
      ), Profile());

  factory Destination.game() =>
      Destination(BottomNavigationBarItem(
          icon: Image.asset("assets/icons/game_idle.png"),
          activeIcon: Image.asset("assets/icons/game_selected.png"),
          title: Text("")
      ), Game());
}

final topDestinations = <Destination>[
  Destination.footprint(),
  Destination.stats(),
  Destination.tips(),
  Destination.news(),
];

final bottomDestinations = <Destination>[
  Destination.profile(),
  Destination.game(),
];

final destinations = topDestinations + bottomDestinations;
