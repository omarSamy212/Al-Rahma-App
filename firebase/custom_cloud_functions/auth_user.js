const functions = require("firebase-functions");
const admin = require("firebase-admin");

// No need to call admin.initializeApp() here

exports.authUser = functions
  .region("europe-west1")
  .https.onRequest((req, res) => {
    // Allow CORS
    res.set("Access-Control-Allow-Origin", "*");
    res.set("Access-Control-Allow-Methods", "POST");
    res.set("Access-Control-Allow-Headers", "Content-Type");

    const uid = req.body.uid;
    const email = req.body.email;

    admin
      .auth()
      .createUser({
        uid: uid,
        email: email,
      })
      .then(() => {
        res
          .status(200)
          .json({ success: true, message: "User created successfully" });
      })
      .catch((error) => {
        console.error("Error creating user:", error);
        res
          .status(500)
          .json({ success: false, message: "Error creating user" });
      });
  });
