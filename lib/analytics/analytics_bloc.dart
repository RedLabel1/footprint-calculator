import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {

  static final Analytics _instance = Analytics._internal();

  FirebaseAnalytics _firebaseAnalytics;

  String analyticsComponentName;

  factory Analytics() => _instance;

  Analytics._internal() {
    _firebaseAnalytics = FirebaseAnalytics();
  }

  void logEvent(String eventName) {
    _firebaseAnalytics.
  }
}
