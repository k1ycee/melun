// This is the database class the user's extra informations would be here

import 'dart:async';

import 'package:big_field_data/models/funds_model.dart';
import 'package:big_field_data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';


class UserActivity{
  final CollectionReference reference = Firestore.instance.collection('User');
  final CollectionReference fundsReference = Firestore.instance.collection('Fundings');
  final StreamController<List<FundsModel>> _fundsStreamsController = 
  StreamController<List<FundsModel>>.broadcast();

// This function inserts the user's Fullname to the firestore database
    Future createUser(User user)async{
    try{
      await reference.document(user.id).setData(user.toJson());
    }
    catch(e){
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }


// This function gets the user from the firestore database

  Future getUser(String uid) async{
    try{
      var userData = await reference.document(uid).get();
      return User.fromData(userData.data);
    }
    catch(e){
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }

// This function puts additional information about the user like the profile picture after they must have signed up

  Future update(User user) async{
    try{
      await reference.document(user.id).updateData(user.toJson());
    }
    catch(e){
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }

// This function is where the user creates their funds post 

  Future createFund(FundsModel fund) async{

     try{
      await fundsReference.add(fund.toJson());
    }
    catch(e){
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }

  }


  // This function fetches information to populate the UI proper this is a one off call like to an API 
  Future getFundsInfo() async{
    try{
      var fundsDocumentSnapshot = await fundsReference.getDocuments();
      if (fundsDocumentSnapshot.documents.isNotEmpty){
        return fundsDocumentSnapshot.documents
          .map((snapshot) => FundsModel.fromData(snapshot.data))
          .toList();
      }
    }
    catch(e){
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }

  }

  // This function gets the fundsInfo in realtime 

  Stream listenToFundsRealtime(){
    fundsReference.snapshots().listen((fund) {
      if (fund.documents.isNotEmpty){
        var zefunds = fund.documents
          .map((snapshot) => FundsModel.fromData(snapshot.data))
          .toList();

      _fundsStreamsController.add(zefunds);
      }
    });
    return _fundsStreamsController.stream;
  }
}