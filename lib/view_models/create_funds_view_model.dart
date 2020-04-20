
import 'dart:io';

import 'package:big_field_data/auth/cloud_storage.dart';
import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/models/funds_model.dart';
import 'package:big_field_data/models/picture_upload.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/utils/image_selector.dart';
import 'package:big_field_data/view_models/base_model.dart';
import 'package:flutter/material.dart';



class CreateFundsViewModel extends BaseModel{
  
  final NavigationService navigate = locator<NavigationService>();
  final UserActivity user = locator<UserActivity>();
  final ImageSelector imageSelector = locator<ImageSelector>();
  final CloudImageUpload _imageUpload = locator<CloudImageUpload>();
  

  UserFundsModel _edittingFunds;
  bool get edittingFunds => _edittingFunds != null;

  File _selectedImage;
  File get selectedImage => _selectedImage;


// Here we pick an Image from the gallery
  Future selectImage() async{
    var imgf = await imageSelector.selectImage();
    if(imgf != null){
      _selectedImage = imgf;
      notifyListeners();
    }
  }

// This is where the whole properties of a fund is inserted
  Future addFunds({@required String title,@required dynamic amount, @required String days})async{
    setBusy(true);

    CloudImages fundsMage;

    // This helps get the image to be uploaded
      fundsMage = await _imageUpload.uploadFundImages(
        imageToUpload: _selectedImage, 
        title: title);
     
    var result;

   
    result = await user.createFund(UserFundsModel(
      projectAmount: amount,  
      projectName: title, 
      documentId: currentuser.id,
      usrImgUrl: fundsMage.imageUrl,
      projectPic: fundsMage.imageFileName
      ));
    setBusy(false);

    if (result is String){
      return result.toString();
    }
    else{
     result.toString();
    }
    navigate.pop();
  }
}