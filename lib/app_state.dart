import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
    _safeInit(() {
      if (prefs.containsKey('ff_authenticatedUser')) {
        try {
          final serializedData =
              prefs.getString('ff_authenticatedUser') ?? '{}';
          _authenticatedUser = AuthorizedUserStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
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

  CurrentShiftInfoStruct _sessionInfo = CurrentShiftInfoStruct();
  CurrentShiftInfoStruct get sessionInfo => _sessionInfo;
  set sessionInfo(CurrentShiftInfoStruct value) {
    _sessionInfo = value;
  }

  void updateSessionInfoStruct(Function(CurrentShiftInfoStruct) updateFn) {
    updateFn(_sessionInfo);
  }

  AuthorizedUserStruct _authenticatedUser = AuthorizedUserStruct();
  AuthorizedUserStruct get authenticatedUser => _authenticatedUser;
  set authenticatedUser(AuthorizedUserStruct value) {
    _authenticatedUser = value;
    prefs.setString('ff_authenticatedUser', value.serialize());
  }

  void updateAuthenticatedUserStruct(Function(AuthorizedUserStruct) updateFn) {
    updateFn(_authenticatedUser);
    prefs.setString('ff_authenticatedUser', _authenticatedUser.serialize());
  }

  DocumentReference? _authUser;
  DocumentReference? get authUser => _authUser;
  set authUser(DocumentReference? value) {
    _authUser = value;
  }

  List<ImageOldPathsStruct> _oldImages = [];
  List<ImageOldPathsStruct> get oldImages => _oldImages;
  set oldImages(List<ImageOldPathsStruct> value) {
    _oldImages = value;
  }

  void addToOldImages(ImageOldPathsStruct value) {
    _oldImages.add(value);
  }

  void removeFromOldImages(ImageOldPathsStruct value) {
    _oldImages.remove(value);
  }

  void removeAtIndexFromOldImages(int index) {
    _oldImages.removeAt(index);
  }

  void updateOldImagesAtIndex(
    int index,
    ImageOldPathsStruct Function(ImageOldPathsStruct) updateFn,
  ) {
    _oldImages[index] = updateFn(_oldImages[index]);
  }

  void insertAtIndexInOldImages(int index, ImageOldPathsStruct value) {
    _oldImages.insert(index, value);
  }

  String _GeneratePDF = '';
  String get GeneratePDF => _GeneratePDF;
  set GeneratePDF(String value) {
    _GeneratePDF = value;
  }

  List<GeneratePDFStruct> _pdf = [];
  List<GeneratePDFStruct> get pdf => _pdf;
  set pdf(List<GeneratePDFStruct> value) {
    _pdf = value;
  }

  void addToPdf(GeneratePDFStruct value) {
    _pdf.add(value);
  }

  void removeFromPdf(GeneratePDFStruct value) {
    _pdf.remove(value);
  }

  void removeAtIndexFromPdf(int index) {
    _pdf.removeAt(index);
  }

  void updatePdfAtIndex(
    int index,
    GeneratePDFStruct Function(GeneratePDFStruct) updateFn,
  ) {
    _pdf[index] = updateFn(_pdf[index]);
  }

  void insertAtIndexInPdf(int index, GeneratePDFStruct value) {
    _pdf.insert(index, value);
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
