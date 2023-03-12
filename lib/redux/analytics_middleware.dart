import 'package:pace_tracker_app/redux/form_update_actions.dart';
import 'package:pace_tracker_app/util/analytics.dart';
import 'package:redux/redux.dart';

void analyticsMiddleware<AppState>(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  if (action is DistanceUpdateAction) {
    AnalyticsClient.instance.logDistanceUpdated();
  } else if (action is PaceUpdateAction) {
    AnalyticsClient.instance.logPaceUpdated();
  } else if (action is TimeUpdateAction) {
    AnalyticsClient.instance.logTimeUpdated();
  }

  next(action);
}
