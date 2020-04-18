import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';

class DashboardViewModel extends BaseModel{
  final NavigationService nav = locator<NavigationService>();

  // Helps user to navigate to the create funds view
  void navCreateFunds(){
    nav.navigateTo(CreateFundsRoute);
  }
   
}