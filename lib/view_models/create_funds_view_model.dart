
import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/models/funds_model.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';
import 'package:flutter/material.dart';



class CreateFundsViewModel extends BaseModel{
  
  final NavigationService navigate = locator<NavigationService>();
  final UserActivity user = locator<UserActivity>();
  

  Future addFunds({@required String title,@required int amount, @required String days})async{
    setBusy(true);
    var result = await user.createFund(FundsModel(
      amount: amount, 
      days: days, 
      projectName: title, 
      id: currentuser.id
      ));
    setBusy(false);

    if (result is String){
      SnackBar(content: Text('Failed to Create funds post because of $result'), backgroundColor: Colors.red,);
    }
    else{
      SnackBar(content: Text('Post Created Successfully !'), backgroundColor: Colors.green,);
      
    }
    navigate.pop();
  }
}