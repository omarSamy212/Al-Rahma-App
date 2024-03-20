const admin = require("firebase-admin/app");
admin.initializeApp();

const getAllNames = require("./get_all_names.js");
exports.getAllNames = getAllNames.getAllNames;
