import 'package:big_field_data/auth/reg_update.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/models/funds_model.dart';
import 'package:big_field_data/models/user_model.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/base_model.dart';



class ProjectsViewModel extends BaseModel {
  final NavigationService nave = locator<NavigationService>();
  final UserActivity active = locator<UserActivity>();

  List<UserFundsModel> _prFunds;
  List<UserFundsModel> get prFunds => _prFunds;

  User _user;
  User get user => _user;

  void listenToUser(){
    setBusy(true);

    active.userCreatedFunds().listen((userYarn){
      List<UserFundsModel> tellUser = userYarn;
      if(tellUser != null && tellUser.length > 0){
        _prFunds = tellUser;
        notifyListeners();
      }

      setBusy(false);
    });
  }
}