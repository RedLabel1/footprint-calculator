import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsBloc {

  FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics();

  String analyticsComponentName;

  void logEvent({ String eventName, Map<String, dynamic> parameters }) {
    _firebaseAnalytics.logEvent(name: eventName, parameters: parameters);
  }
}
