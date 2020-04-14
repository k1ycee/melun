import 'package:big_field_data/Views/shared/buttonUI.dart';
import 'package:big_field_data/Views/shared/inputdecor.dart';
import 'package:big_field_data/Views/shared/uiHelpers.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/services/navigation_services.dart';
// import 'package:big_field_data/view_models/signin_view_model.dart';
import 'package:big_field_data/view_models/signup_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';



class SignUp extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final NavigationService nav = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(), 
      builder: (context,model,child) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
        child: ListView(
          children: <Widget>[
            Center(child: Text('Covid-19',style: TextStyle(color: Colors.blue[900], fontSize: 45, fontWeight: FontWeight.bold),),),
            Center(child: Text('Relief',style: TextStyle(color: Colors.blue[900], fontSize: 40, fontWeight: FontWeight.w100),),),
            verticalSpaceMedium,
            Container(alignment: Alignment.topLeft,child: Text('Sign Up',style:TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.blue[900])),),
            verticalSpaceLarge,
            InputField(
              controller: fullnameController,
              placeholder: 'Fullname',
            ),
            verticalSpaceMedium,
            InputField(controller: emailController,placeholder: 'E-mail',),
            verticalSpaceMedium,
            InputField(controller: passwordController,placeholder: 'Password',password: true,),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                BusyButton(
                  busy: model.busy,
                  title: 'SignUp',
                  onPressed: () {model.signup(
                    emailController.text, 
                    passwordController.text, 
                    fullnameController.text);
                  },
                )
              ],
            ),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                  text: 'Already Have an account? Sign In',
                  style: TextStyle(color: Colors.blue[900]),
                  recognizer: TapGestureRecognizer()..onTap = (){
                    nav.navigateTo(SignInViewRoute);
                  }
                  ),
                )
              ],
            ),
          ],
        ),
        )
      )
    );
  }
}