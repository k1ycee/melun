import 'package:big_field_data/Views/shared/uiHelpers.dart';
import 'package:big_field_data/models/dashboard_model.dart';
import 'package:flutter/material.dart';



class DashCard extends StatelessWidget {
  final GeneralFundsModel dash;
  const DashCard({this.dash, Key key}): super(key:key) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.grey),

        child: Container(
              height: 300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.only(top: 31),
                child: Column(children: <Widget>[
              // Container(
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              //   child: Container(height:240, width:400,color: Colors.black, child: Image.network('https://picsum.photos/200/300')),
              // ),
              verticalSpaceTiny,
              Text(dash.projectName),
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(dash.projectAmount),
                    Text(dash.documentId),
                    // Text(dash.name)
                ],),
              )
          ],),
          ),
        )
    );
  }
}