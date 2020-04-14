import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/models/dashboard_model.dart';
import 'package:big_field_data/models/funds_model.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';
import 'package:flutter/material.dart';

class DashboardViewModel extends BaseModel{
  final NavigationService nav = locator<NavigationService>();
  final UserActivity activity = locator<UserActivity>();

/// This is the view-model for the dashboard screen 
  List<DashModel> _dash;
  List<DashModel> get dash => _dash;

  Future fetchFunds() async{
    setBusy(true);
    var fundsResult = await activity.getFundsInfo();
    setBusy(false);

    if(fundsResult is List<DashModel>){
      _dash = fundsResult;
      notifyListeners();
    }
    else{
      SnackBar(content: Text('Failed to Update funds post because of $fundsResult'), backgroundColor: Colors.red[700],);
    }
  } 
  // Helps user to navigate to the create funds view
  void navCreateFunds(){
    nav.navigateTo(CreateFundsRoute);
  }
}