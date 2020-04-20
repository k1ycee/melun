import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/models/dashboard_model.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';

class RecommendationsViewModel extends BaseModel{

  final UserActivity activity = locator<UserActivity>();
  final NavigationService nav = locator<NavigationService>();

/// This is the view-model for the dashboard screen 
  List<GeneralFundsModel> _dash;
  List<GeneralFundsModel> get dash => _dash;


   void listenToFunds(){
    setBusy(true);
    activity.listenToFundsRealtime().listen((fundsData){
      List<GeneralFundsModel> updatedFunds = fundsData;
      if(updatedFunds != null && updatedFunds.length > 0){
        _dash = updatedFunds;
        notifyListeners();
      }
      setBusy(false);
    });
  } 

  void pay(){
    nav.navigateTo(PaymentRoute);
  }
}