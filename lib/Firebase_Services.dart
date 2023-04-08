import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Firebase_Serv {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final adminhubref = FirebaseFirestore.instance.collection('Adminhub');
 

  Future<bool> checkif_admin_is_registered(String uid) async {
    User? user = _auth.currentUser;
    await adminhubref.doc(user!.uid).get().then((snap) {

      if (snap['admin_name'] != null) {
        return true;
      } else {
        return false;
      }
    });

    return false;
  }

  Future<void> uploadadmininfo() async {
    User? user = _auth.currentUser;
    await adminhubref.doc(user!.uid).set({
      'admin_name': 'dhrumit',
      "org_name": "xyzorg",
    });
  }




  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }
}
