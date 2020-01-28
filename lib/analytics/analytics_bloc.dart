import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsBloc {

  FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics();

  void logEvent({ String eventName, Map<String, dynamic> parameters }) {
    firebaseAnalytics.logEvent(name: eventName, parameters: parameters);
  }
}
