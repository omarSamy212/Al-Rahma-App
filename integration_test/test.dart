import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:al_rahma/flutter_flow/flutter_flow_drop_down.dart';
import 'package:al_rahma/flutter_flow/flutter_flow_icon_button.dart';
import 'package:al_rahma/flutter_flow/flutter_flow_widgets.dart';
import 'package:al_rahma/flutter_flow/flutter_flow_theme.dart';
import 'package:al_rahma/index.dart';
import 'package:al_rahma/main.dart';
import 'package:al_rahma/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:al_rahma/backend/firebase/firebase_config.dart';
import 'package:al_rahma/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    _overrideOnError();
    await initFirebase();

    await FlutterFlowTheme.initialize();

    await FFLocalizations.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('create user', () {
    setUp(() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: '3012@elrahma.com', password: 'lJ6XDmf1');
    });

    testWidgets('createUser', (WidgetTester tester) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: '3012@elrahma.com', password: 'lJ6XDmf1');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: CreateUserWidget(),
        ),
      ));

      await tester.enterText(find.byKey(ValueKey('lastName_jaec')), 'عمر');
      await tester.enterText(find.byKey(ValueKey('middleName_kzn4')), 'حسام');
      await tester.enterText(find.byKey(ValueKey('lastName_jaec')), 'الدين');
      await tester.enterText(find.byKey(ValueKey('nickName_qm58')), 'بيبو');
      await tester.enterText(
          find.byKey(ValueKey('nationalID_ojf9')), '30112122103835');
      await tester.tap(find.byKey(ValueKey('Age_wkst')));
      await tester.enterText(
          find.byKey(ValueKey('natPlaceOfIssue_xuhc')), 'الجيزة');
      await tester.enterText(find.byKey(ValueKey('government_punx')), 'أكتوبر');
      await tester.enterText(find.byKey(ValueKey('city_xqlm')), 'أكتوبر');
      await tester.enterText(
          find.byKey(ValueKey('phoneNumber_nmzu')), '01140820404');
      await tester.enterText(find.byKey(ValueKey('eduData_1h8g')), 'Educated');
      await tester.tap(find.byKey(ValueKey('Button_6yah')));
    });
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
