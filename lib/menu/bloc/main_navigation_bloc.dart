import 'package:flutter/cupertino.dart';
import 'package:footprint_calculator/analytics/analytics.dart';
import 'package:footprint_calculator/generated/l10n.dart';
import 'package:rxdart/rxdart.dart';

class MainNavigationBloc implements Analytics {
  int _initialDestination;
  PublishSubject<int> _currentDestination;

  MainNavigationBloc() {
    _initialDestination = 0;
    _currentDestination = PublishSubject<int>();
  }

  @override
  String get analyticsComponentName => "main_navigation";

  Map<int, String> destinations(BuildContext context) => {
        0: S.of(context).screen_name_footprint,
        1: S.of(context).screen_name_tips,
        2: S.of(context).screen_name_game,
        3: S.of(context).screen_name_shop,
      };

  int get initialDestination => _initialDestination;

  Observable<int> get currentDestination => _currentDestination.stream;

  set destination(int destination) => _currentDestination.add(destination);

  void dispose() => _currentDestination.close();
}
