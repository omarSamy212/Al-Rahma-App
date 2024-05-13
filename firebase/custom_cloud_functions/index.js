const admin = require("firebase-admin/app");
admin.initializeApp();

const getAllNames = require("./get_all_names.js");
exports.getAllNames = getAllNames.getAllNames;
const authUser = require("./auth_user.js");
exports.authUser = authUser.authUser;
const distributeWorkers = require("./distribute_workers.js");
exports.distributeWorkers = distributeWorkers.distributeWorkers;
const clearSessionWorkers = require("./clear_session_workers.js");
exports.clearSessionWorkers = clearSessionWorkers.clearSessionWorkers;
