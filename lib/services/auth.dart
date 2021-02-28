import 'package:firebase_auth/firebase_auth.dart';
import 'package:stagetime/models/user.dart';
class AuthService{


  final FirebaseAuth _auth=FirebaseAuth.instance;

  //sign in

  UserModel _userFromFirebaseUser(User user){
    return user != null ? UserModel(uid:user.uid):null;
  }

  Stream <UserModel> get user {
    return _auth.authStateChanges()
      .map( _userFromFirebaseUser);
  }


//Signup with email &pass
  Future signUpStageTime(String email,String password) async {

    try{
        UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        User user=result.user;
        return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  

Future signOut() async{
  try{
    return await FirebaseAuth.instance.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }
}
}

