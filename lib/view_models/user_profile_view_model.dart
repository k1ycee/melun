// import 'package:big_field_data/auth/auth.dart';
// import 'package:big_field_data/auth/reg_update.dart';
// import 'package:big_field_data/constants/routes.dart';
// import 'package:big_field_data/locator.dart';
// import 'package:big_field_data/models/user_model.dart';
// import 'package:big_field_data/services/navigation_services.dart';
// import 'package:big_field_data/view_models/base_model.dart';

// class UserProfileViewModel extends BaseModel{

//   List<User> _user;
//   List<User> get user => _user;

//   final UserActivity _activity = locator<UserActivity>();
//   final Auth _auth = locator<Auth>();
//   final NavigationService _service = locator<NavigationService>();

//   Future popProfile() async{
//     setBusy(true);

//      List<User> user = await _activity.getUser(currentuser.id);
//     setBusy(false);

//     if (user is User){
//       _user = user;
//       notifyListeners();
//     }
//     else{
//       return user.toString();
//     }
//   }

//   Future logOut()async{
//     setBusy(true);

//     var out = await _auth.signOut();
//     setBusy(false);
//     if (out is String){
//       return out.toString();
//     }
//     else{
//       _service.navigateTo(SignInViewRoute);
//     }
//    }
// }