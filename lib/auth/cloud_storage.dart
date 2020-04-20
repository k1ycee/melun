import 'dart:io';

import 'package:big_field_data/models/picture_upload.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class CloudImageUpload{


  Future<CloudImages> uploadFundImages({@required File imageToUpload,@required String title})async{
    var imageFileName = title + DateTime.now().millisecondsSinceEpoch.toString();

    final StorageReference cloudStorageRef = FirebaseStorage.instance.ref().child('Funds');

    StorageUploadTask uploadTask = cloudStorageRef.putFile(imageToUpload);
    StorageTaskSnapshot imgSnapshot = await uploadTask.onComplete;


    var downloadUrl = await imgSnapshot.ref.getDownloadURL();

    if (uploadTask.isComplete){
      var url = downloadUrl.toString();
      return CloudImages(imageFileName:imageFileName, imageUrl: url);
    }
    return null;
  }

    Future<CloudImages> uploadUserImages({@required File imageToUpload,@required String title})async{
    var imageFileName = title + DateTime.now().millisecondsSinceEpoch.toString();

    final StorageReference cloudStorageRef = FirebaseStorage.instance.ref().child('Users');

    StorageUploadTask uploadTask = cloudStorageRef.putFile(imageToUpload);
    StorageTaskSnapshot imgSnapshot = await uploadTask.onComplete;


    var downloadUrl = await imgSnapshot.ref.getDownloadURL();

    if (uploadTask.isComplete){
      var url = downloadUrl.toString();
      return CloudImages(imageFileName:imageFileName, imageUrl: url);
    }
    return null;
  }
}