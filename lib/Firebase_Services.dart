import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Firebase_Serv {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static final adminhubref = FirebaseFirestore.instance.collection('Adminhub');
  static final allemployeehubref =
      FirebaseFirestore.instance.collection('All_employee_hub');

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

  static Future<void> uploadadmininfo(
      String name, String orgname, String role, String phonenum) async {
    User? user = _auth.currentUser;
    await adminhubref.doc(user!.uid).set({
      'admin_name': name,
      "org_name": orgname,
      "role": role,
      "phone_num": phonenum,
    });
  }

  static Future<bool> check_employee_is_already_registered(
      String adharnum, String pannum) async {
    final check = await allemployeehubref
        .where('adharcard_num', isEqualTo: adharnum)
        .where('pancard_num', isEqualTo: pannum)
        .get();
    if (check.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }




  static Future<void> upload_employee_data_bothplace(
      String name,
      String adhar_num,
      String pan_num,
      String experience,
      String expertice,
    
    ) async {

    await allemployeehubref.doc(adhar_num).set({
      'name': name,
      'adharcard_num': adhar_num,
      'experience_year': experience,
      'expertice': experience,
      
      'pancard_num': pan_num,
    });

    await adminhubref.doc(_auth.currentUser!.uid).collection('my_employees').doc(adhar_num).set({
      'name': name,
      'adharcard_num': adhar_num,
      'experience_year': experience,
      'expertice': experience,
      
      'pancard_num': pan_num,
    });

   
  }

  static Future<void> get_my_all_employees() async {
    User? user = _auth.currentUser;
    final myemployees =
        await adminhubref.doc(user!.uid).collection('my_employees').get();
   
  }

  static Future<void> signOutGoogle() async {
    await _auth.signOut();
    await googleSignIn.signOut();

    print("User Sign Out");
  }
}
