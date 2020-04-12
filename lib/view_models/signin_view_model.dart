import 'package:big_field_data/auth/auth.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';




class SignInViewModel extends BaseModel{
  final Auth _auth = locator<Auth>();
  final NavigationService _navigationService = locator<NavigationService>();


  Future signIn(email, password)async{
    setBusy(true);
    final result = await _auth.signInUser(email: email, password: password);
    setBusy(false);
    if(result is bool){
      if(result){
        _navigationService.navigateTo(DashboardRoute);
      }
      else{
        print('Well errors are looming somewhere find it');
      }
    }
    else{
      print('This was not supposed to happen');
    }
  }
}