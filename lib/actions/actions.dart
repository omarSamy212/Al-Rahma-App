import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future internetConnection(BuildContext context) async {
  bool? internetReturn;

  logFirebaseEvent('internetConnection_custom_action');
  internetReturn = await actions.checkInternetConnection();
  if (internetReturn) {
    return;
  }

  logFirebaseEvent('internetConnection_alert_dialog');
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: const Text('خطأ في الانترنت'),
        content: const Text('من فضلك قم بالتأكد من وجود اتصال بالأنترنت'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: const Text('حسنا'),
          ),
        ],
      );
    },
  );
  return;
}
