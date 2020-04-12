import 'package:big_field_data/auth/auth.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';

class StartUpViewModel extends BaseModel{

  final Auth auths = locator<Auth>();
  final NavigationService navigate = locator<NavigationService>();

  Future handleStartUpLogic()async{
    var userAvailable = await auths.userAvailbale();
    
    if(userAvailable){
      navigate.navigateTo(DashboardRoute);
    }else{
      navigate.navigateTo(SignInViewRoute);
    }
  }
}