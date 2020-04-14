import 'package:big_field_data/Views/UI/create_funds.dart';
import 'package:big_field_data/Views/UI/dash_board.dart';
import 'package:big_field_data/Views/UI/sign_in.dart';
import 'package:big_field_data/Views/UI/sign_up.dart';
import 'package:big_field_data/Views/UI/start_up.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:flutter/material.dart';


Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name){
    case SignInViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignIn()
      );

    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUp(),
      );
    case DashboardRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Dashboard(),
      );
    case StartUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartUp(),
      );
    case CreateFundsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreateFunds(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
   }
}




PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
  }