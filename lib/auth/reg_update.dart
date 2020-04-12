// This is the database class the user's extra informations would be here

import 'package:big_field_data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserActivity{
  final CollectionReference reference = Firestore.instance.collection('User');


    Future createUser(User user)async{
    try{
      await reference.document(user.id).setData(user.toJson());
    }
    catch(e){
      return e.toString();
    }
  }

  Future getUser(String uid) async{
    try{
      var userData = await reference.document(uid).get();
      return User.fromData(userData.data);
    }
    catch(e){
      return e.toString();
    }
  }
  Future update(User user) async{
    try{
      await reference.document(user.id).updateData(user.toJson());
    }
    catch(e){
      return e.toString();
    }
  }
}