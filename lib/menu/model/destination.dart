import 'package:flutter/material.dart';
import 'package:footprint_calculator/game/game.dart';
import 'package:footprint_calculator/shop/shop.dart';
import 'package:footprint_calculator/footprint/footprint.dart';
import 'package:footprint_calculator/tips/tips.dart';

class Destination {

  final BottomNavigationBarItem _bottomNavigationBarItem;
  final Widget _child;
  final String _title;

  get bottomNavigationBarItem => _bottomNavigationBarItem;

  get child => _child;

  get title => _title;

  Destination(this._bottomNavigationBarItem, this._child, this._title);

  factory Destination.footprint() =>
      Destination(
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/footprint_idle.png"),
            activeIcon: Image.asset("assets/icons/footprint_selected.png"),
            title: Text("Huella de carbono"),
          ),
          Footprint(),
          "Huella de carbono");

  factory Destination.tips() =>
      Destination(
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/tips_idle.png"),
              activeIcon: Image.asset("assets/icons/tips_selected.png"),
              title: Text("Consejos")
          ),
          Tips(),
          "Consejos");

  factory Destination.game() =>
      Destination(
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/game_idle.png"),
              activeIcon: Image.asset("assets/icons/game_selected.png"),
              title: Text("Juego")
          ),
          Game(),
          "Juego");

  factory Destination.shop() =>
      Destination(
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/shop_idle.png"),
              activeIcon: Image.asset("assets/icons/shop_selected.png"),
              title: Text("Tienda")
          ),
          Shop(),
          "Tienda");
}

final destinations = <Destination>[
  Destination.footprint(),
  Destination.tips(),
  Destination.game(),
  Destination.shop(),
];
