import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

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

  List<int> _casillas = [1, 2, 3, 4, 5];
  List<int> get casillas => _casillas;
  set casillas(List<int> _value) {
    _casillas = _value;
  }

  void addToCasillas(int _value) {
    _casillas.add(_value);
  }

  void removeFromCasillas(int _value) {
    _casillas.remove(_value);
  }

  void removeAtIndexFromCasillas(int _index) {
    _casillas.removeAt(_index);
  }

  void updateCasillasAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _casillas[_index] = updateFn(_casillas[_index]);
  }

  void insertAtIndexInCasillas(int _index, int _value) {
    _casillas.insert(_index, _value);
  }

  String _externado = '0';
  String get externado => _externado;
  set externado(String _value) {
    _externado = _value;
  }

  String _matriculaTest = '';
  String get matriculaTest => _matriculaTest;
  set matriculaTest(String _value) {
    _matriculaTest = _value;
  }
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
