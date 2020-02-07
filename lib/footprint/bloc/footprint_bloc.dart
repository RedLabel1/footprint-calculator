import 'package:flutter/material.dart';
import 'package:footprint_calculator/generated/l10n.dart';
import 'package:footprint_calculator/main.dart';
import 'package:rxdart/rxdart.dart';

class FootprintBloc {
  int _initialDestination;
  PublishSubject<int> _currentDestination;

  FootprintBloc() {
    _initialDestination = 1;
    _currentDestination = PublishSubject<int>();
  }

  Map<int, String> steps(BuildContext context) => {
        1: S.of(context).screen_name_footprint,
        2: S.of(context).screen_name_tips,
        3: S.of(context).screen_name_game,
        4: S.of(context).screen_name_shop,
      };

  int get initialDestination => _initialDestination;

  Observable<int> get currentDestination => _currentDestination.stream;

  set destination(int destination) => _currentDestination.add(destination);

  void navigateTo(Routes route, BuildContext context) =>
      Navigator.of(context).pushNamed(routes[route]);

  void endJourney(BuildContext context) =>
      Navigator.of(context).popUntil(ModalRoute.withName(routes[Routes.MAIN]));

  void dispose() => _currentDestination.close();
}
