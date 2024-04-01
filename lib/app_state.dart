import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
      _toolsCart = prefs
              .getStringList('ff_toolsCart')
              ?.map((x) {
                try {
                  return ArrayOfToolsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _toolsCart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<ArrayOfToolsStruct> _toolsCart = [];
  List<ArrayOfToolsStruct> get toolsCart => _toolsCart;
  set toolsCart(List<ArrayOfToolsStruct> _value) {
    _toolsCart = _value;
    prefs.setStringList(
        'ff_toolsCart', _value.map((x) => x.serialize()).toList());
  }

  void addToToolsCart(ArrayOfToolsStruct _value) {
    _toolsCart.add(_value);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  void removeFromToolsCart(ArrayOfToolsStruct _value) {
    _toolsCart.remove(_value);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromToolsCart(int _index) {
    _toolsCart.removeAt(_index);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  void updateToolsCartAtIndex(
    int _index,
    ArrayOfToolsStruct Function(ArrayOfToolsStruct) updateFn,
  ) {
    _toolsCart[_index] = updateFn(_toolsCart[_index]);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInToolsCart(int _index, ArrayOfToolsStruct _value) {
    _toolsCart.insert(_index, _value);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  List<int> _complainsCounter = [1];
  List<int> get complainsCounter => _complainsCounter;
  set complainsCounter(List<int> _value) {
    _complainsCounter = _value;
  }

  void addToComplainsCounter(int _value) {
    _complainsCounter.add(_value);
  }

  void removeFromComplainsCounter(int _value) {
    _complainsCounter.remove(_value);
  }

  void removeAtIndexFromComplainsCounter(int _index) {
    _complainsCounter.removeAt(_index);
  }

  void updateComplainsCounterAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _complainsCounter[_index] = updateFn(_complainsCounter[_index]);
  }

  void insertAtIndexInComplainsCounter(int _index, int _value) {
    _complainsCounter.insert(_index, _value);
  }
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
