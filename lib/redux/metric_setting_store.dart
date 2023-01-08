import 'package:redux/redux.dart';

import 'metric_setting_reducer.dart';

final Store<bool> metricSettingStore =
    Store<bool>(metricSettingReducer, initialState: false);
