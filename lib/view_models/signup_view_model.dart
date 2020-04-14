import 'package:big_field_data/auth/auth.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';



class SignUpViewModel extends BaseModel{
    
    final Auth _auth =  locator<Auth>();
    final NavigationService _navegate = locator<NavigationService>();


    Future signup(email, password, fullname)async{
      setBusy(true);
      var result = await _auth.signUpUser(email: email, password: password, fullname: fullname);
      setBusy(false);
      if(result is bool){
      if(result){
        _navegate.navigateTo(DashboardRoute);
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