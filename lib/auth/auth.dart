import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserActivity _activity = locator<UserActivity>();

  User _user;
  User get user => _user;

  Future _populateUser(FirebaseUser user)async{
    if(user != null){
      _user = await _activity.getUser(user.uid);
    }
  }

  Future signUpUser({String email, String password, String fullname})async{
      try{
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;

        await _activity.createUser(User(
          id: result.user.uid,
          fullname: fullname
        ));

        return user != null;
      }
      catch(e){
        print(e.toString());
        return null;
      }
  }

    // firebase Auth Signin
  Future signInUser({String email, String password})async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await _populateUser(result.user);
      return user != null;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

    // Firebase Auth sign-out function
  Future signOut()async{
    try{
      _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

    Future<bool> userAvailbale() async{
    var user = await _auth.currentUser();
    await _populateUser(user);
    return user != null;
  }
}