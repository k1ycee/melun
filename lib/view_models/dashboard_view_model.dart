import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/models/dashboard_model.dart';
import 'package:big_field_data/models/funds_model.dart';
import 'package:big_field_data/models/user_model.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';
import 'package:flutter/material.dart';

class DashboardViewModel extends BaseModel{
  final NavigationService nav = locator<NavigationService>();
  final UserActivity activity = locator<UserActivity>();

/// This is the view-model for the dashboard screen 
  List<DashModel> _dash;
  List<DashModel> get dash => _dash;

  User _user;
  User get user => _user;

  void listenToFunds(){
    setBusy(true);
    activity.listenToFundsRealtime().listen((fundsData){
      List<DashModel> updatedFunds = fundsData;
      if(updatedFunds != null && updatedFunds.length < 0){
        _dash = updatedFunds;
        notifyListeners();
      }
      setBusy(false);
    });
  } 

  // This function call fetches the users details from the database
    Future fetchUser() async{
    setBusy(true);
    var userResult = await activity.getUser(currentuser.id);
    setBusy(false);

    if(userResult is User){
      _user = userResult;
      notifyListeners();
    }
    else{
      SnackBar(content: Text('User does not exist create an account'), backgroundColor: Colors.red[700],);
    }
  } 
  // Helps user to navigate to the create funds view
  void navCreateFunds(){
    nav.navigateTo(CreateFundsRoute);
  } 
}