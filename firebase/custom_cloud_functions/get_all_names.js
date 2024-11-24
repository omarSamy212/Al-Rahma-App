const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.getAllNames = functions.https.onCall((data, context) => {
  const val1 = data.val1;
  const val2 = data.val2;

  return val1 + val2;
});
