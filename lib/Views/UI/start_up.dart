

import 'package:big_field_data/view_models/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class StartUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModel: StartUpViewModel(), 
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context,model,child) => Scaffold(
        body:
        Stack(children: <Widget>[
          Container(color: Colors.indigo[900],)
        ],)
      )
    );
  }
}