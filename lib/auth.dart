import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future register() async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password)
    }catch(e){

    }
  }
}
