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
  set toolsCart(List<ArrayOfToolsStruct> value) {
    _toolsCart = value;
    prefs.setStringList(
        'ff_toolsCart', value.map((x) => x.serialize()).toList());
  }

  void addToToolsCart(ArrayOfToolsStruct value) {
    _toolsCart.add(value);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  void removeFromToolsCart(ArrayOfToolsStruct value) {
    _toolsCart.remove(value);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromToolsCart(int index) {
    _toolsCart.removeAt(index);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  void updateToolsCartAtIndex(
    int index,
    ArrayOfToolsStruct Function(ArrayOfToolsStruct) updateFn,
  ) {
    _toolsCart[index] = updateFn(_toolsCart[index]);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInToolsCart(int index, ArrayOfToolsStruct value) {
    _toolsCart.insert(index, value);
    prefs.setStringList(
        'ff_toolsCart', _toolsCart.map((x) => x.serialize()).toList());
  }

  List<int> _complainsCounter = [1];
  List<int> get complainsCounter => _complainsCounter;
  set complainsCounter(List<int> value) {
    _complainsCounter = value;
  }

  void addToComplainsCounter(int value) {
    _complainsCounter.add(value);
  }

  void removeFromComplainsCounter(int value) {
    _complainsCounter.remove(value);
  }

  void removeAtIndexFromComplainsCounter(int index) {
    _complainsCounter.removeAt(index);
  }

  void updateComplainsCounterAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _complainsCounter[index] = updateFn(_complainsCounter[index]);
  }

  void insertAtIndexInComplainsCounter(int index, int value) {
    _complainsCounter.insert(index, value);
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
