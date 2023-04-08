import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Firebase_Serv{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> uploadadmininfo() async {
     

   
  }

  void signOutGoogle() async{
    await googleSignIn.signOut();

    print("User Sign Out");
  }
}