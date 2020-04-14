

import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String id;
  final String fullname;
  final String userImage;
  final DocumentReference reference;

  User({this.userImage, this.reference, this.id, this.fullname});
    User.fromData(Map<String,dynamic> data, {this.reference})
    :   id = data["id"],
        fullname = data["fullname"],
        userImage = data["userImage"];
    User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromData(snapshot.data, reference: snapshot.reference);



  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'fullname':fullname,
      'userImage': userImage
    };
  }
}