import 'package:big_field_data/auth/auth.dart';
import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/models/user_model.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';

class DashboardViewModel extends BaseModel{
  final NavigationService nav = locator<NavigationService>();
  final UserActivity _activity = locator<UserActivity>();
  final Auth _auth = locator<Auth>();

  User _user;
  User get user => _user;

  Future popProfile() async{
    setBusy(true);

    User user = await _activity.getUser(currentuser.id);
    setBusy(false);

    if (user is User){
      _user = user;
      notifyListeners();
    }
    else{
      return user.toString();
    }
  }

  Future logOut()async{
    setBusy(true);

    var out = await _auth.signOut();
    setBusy(false);
    if (out is String){
      return out.toString();
    }
    else{
      nav.navigateTo(SignInViewRoute);
    }
   }

  // Helps user to navigate to the create funds view
  void navCreateFunds(){
    nav.navigateTo(CreateFundsRoute);
  }
}