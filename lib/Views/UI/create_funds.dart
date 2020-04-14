import 'package:big_field_data/Views/shared/inputdecor.dart';
import 'package:big_field_data/Views/shared/uiHelpers.dart';
import 'package:big_field_data/view_models/create_funds_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_architecture/provider_architecture.dart';





class CreateFunds extends StatelessWidget {

  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final daysController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateFundsViewModel>.withConsumer(
      viewModel: CreateFundsViewModel(), 
      builder: (context ,model ,child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(!model.busy){
              model.addFunds(
                title: titleController.text, 
                amount: amountController.hashCode, 
                days: daysController.text);
            }
          }, 
          child: !model.busy ? Icon(Icons.send) : CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:20),
          child: ListView(
            children: <Widget>[
              verticalSpaceSmall,
              Center(child:Text('Request Funds', style: TextStyle(color: Colors.blue[900],fontSize: 35, fontWeight: FontWeight.w300))),
              verticalSpaceMedium,
              Text('Project Name', style: TextStyle(color: Colors.blue[900]),),
              verticalSpaceTiny,
              InputField(placeholder: 'Project Name',controller: titleController,),
              verticalSpaceMedium,
              Text('Amount', style: TextStyle(color: Colors.blue[900]),),
              verticalSpaceTiny,
              InputField(placeholder: 'Amount', controller: amountController,textInputType: TextInputType.number,),
              verticalSpaceMedium,
              Text('Days', style: TextStyle(color: Colors.blue[900]),),
              verticalSpaceTiny,
              InputField(placeholder: 'Days', controller: daysController,textInputType: TextInputType.number,),
              verticalSpaceMedium,
              Text('Project Picture', style: TextStyle(color: Colors.blue[900]),),
              verticalSpaceTiny,
              Container(
                height: 250,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[200],),
                alignment: Alignment.center,
                child: Text('Tap to upload an Image',style: TextStyle(color: Colors.grey[400]),),
              ),
              verticalSpaceLarge
            ],
          ),
        ),
      )
    );
  }
}