import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _theme = prefs.getBool('ff_theme') ?? _theme;
    });
    _safeInit(() {
      _refreshTokenCalendar =
          prefs.getString('ff_refreshTokenCalendar') ?? _refreshTokenCalendar;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _matricula = 0;
  int get matricula => _matricula;
  set matricula(int _value) {
    _matricula = _value;
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
  }

  bool _theme = true;
  bool get theme => _theme;
  set theme(bool _value) {
    _theme = _value;
    prefs.setBool('ff_theme', _value);
  }

  String _refreshTokenCalendar = '';
  String get refreshTokenCalendar => _refreshTokenCalendar;
  set refreshTokenCalendar(String _value) {
    _refreshTokenCalendar = _value;
    prefs.setString('ff_refreshTokenCalendar', _value);
  }

  final _calendarItemListManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> calendarItemList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _calendarItemListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCalendarItemListCache() => _calendarItemListManager.clear();
  void clearCalendarItemListCacheKey(String? uniqueKey) =>
      _calendarItemListManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
