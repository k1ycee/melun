

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
          Container(color: Colors.indigo[900],),
          Positioned( left: 64,right: 70,top:70,child: Text('COVID - 19', style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),)),
          Positioned( left: 120,right: 70,top:130,child: Text('Relief', style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w300),)),
        ],)
      )
    );
  }
}