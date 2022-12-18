import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  late SharedPreferences prefs;

  bool _toggle1 = false;
  bool get toggle1 => _toggle1;
  set toggle1(bool _value) {
    notifyListeners();

    _toggle1 = _value;
  }

  bool _toggle2 = false;
  bool get toggle2 => _toggle2;
  set toggle2(bool _value) {
    notifyListeners();

    _toggle2 = _value;
  }

  bool _toggle3 = false;
  bool get toggle3 => _toggle3;
  set toggle3(bool _value) {
    notifyListeners();

    _toggle3 = _value;
  }

  String _toggle4 = '';
  String get toggle4 => _toggle4;
  set toggle4(String _value) {
    notifyListeners();

    _toggle4 = _value;
  }

  List<String> _survey = [];
  List<String> get survey => _survey;
  set survey(List<String> _value) {
    notifyListeners();

    _survey = _value;
  }

  void addToSurvey(String _value) {
    notifyListeners();
    _survey.add(_value);
  }

  void removeFromSurvey(String _value) {
    notifyListeners();
    _survey.remove(_value);
  }

  bool _fulllist = true;
  bool get fulllist => _fulllist;
  set fulllist(bool _value) {
    notifyListeners();

    _fulllist = _value;
  }

  String _writer = '';
  String get writer => _writer;
  set writer(String _value) {
    notifyListeners();

    _writer = _value;
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
