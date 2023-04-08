import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Firebase_Serv {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static final adminhubref = FirebaseFirestore.instance.collection('Adminhub');

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential cred =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return cred;
  }

  static Future<void> add_Admin_uid() async {
    User? user = _auth.currentUser;
    await adminhubref.doc(user!.uid).set({
      'admin_uid': user.uid,
      'admin_name': '',
    });
  }

  static Future<bool> checkif_admin_is_registered(String uid) async {
    User? user = _auth.currentUser;

    DocumentSnapshot sn = await adminhubref.doc(user!.uid).get();
    if (sn.exists) {
      return true;
    } else {
      return false;
    }
  }




static  Future<void> uploadadmininfo(String name,String orgname,String role,String phonenum) async {
    User? user = _auth.currentUser;
    await adminhubref.doc(user!.uid).set({
      'admin_name': name,
      "org_name": orgname,
      "role": role,
      "phone_num": phonenum,
    });
  }

  static Future<void> signOutGoogle() async {
    await _auth.signOut();
    await googleSignIn.signOut();

    print("User Sign Out");
  }
}
