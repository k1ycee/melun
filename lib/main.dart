import 'package:big_field_data/Views/UI/create_funds.dart';
import 'package:big_field_data/Views/UI/dash_board.dart';
import 'package:big_field_data/Views/UI/sign_up.dart';
import 'package:big_field_data/Views/UI/start_up.dart';
import 'package:big_field_data/Views/shared/dash_view.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/router.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:flutter/material.dart';

void main() {
  locatorSetup();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: StartUp(),
      onGenerateRoute: generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
    );
  }
}

