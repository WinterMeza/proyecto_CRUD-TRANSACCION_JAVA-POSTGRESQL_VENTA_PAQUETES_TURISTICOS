const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();


exports.onUserCreate = functions.firestore.document('sastifaccion/{sastifaccion_Id}').onCreate(async (snap, context) => {
    const values = snap.data();
    const query = db.collection("sastifaccion");
    const snapshot = await query.where("id_sastifacion", "==", values.id_sastifacion).get();
    let b = 0;
    snapshot.forEach(querysnapshot => {
        b = querysnapshot.data().malas_visitas
    });
    console.log(b);
    if (b > 2) {
        try {
            await db.collection('sastifaccion').doc(snap.id).delete();
        } catch (error) {
            console.log(error);
        }
    }
})

