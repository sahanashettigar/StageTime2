import 'package:firebase_auth/firebase_auth.dart';
import 'package:stagetime/models/user.dart';
class AuthService{


  final FirebaseAuth _auth=FirebaseAuth.instance;

  //sign in

  UserModel _userFromFirebaseUser(User user){
    return user != null ? UserModel(uid:user.uid):null;
  }

  // Stream<UserModel> get user {
  //   return _auth.onAuthStateChanged.map((User user)=>_userFromFirebaseUser(user));
  // }


//Signup with email &pass
  Future signUpStageTime(String email,String password) async {

    try{
        UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        User user=result.user;
        return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  


}