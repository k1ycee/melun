import 'package:big_field_data/Views/shared/uiHelpers.dart';
import 'package:big_field_data/models/dashboard_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class DashCard extends StatelessWidget {
  final GeneralFundsModel dash;
  const DashCard({this.dash, Key key}): super(key:key) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),

          child: Container(
                height: 300,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[100]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Container(height:230, width:350,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)), child: CachedNetworkImage(imageUrl: '${dash.usrImgUrl}')),
                ),
                verticalSpaceTiny,
                Text(dash.projectName,style: TextStyle(color: Colors.grey[500], fontSize: 20,fontWeight: FontWeight.w300),),
                verticalSpaceTiny,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('NGN ${dash.projectAmount}', style: TextStyle(color: Colors.blue),),
                  ],),
                )
            ],),
            ),
          )
      ),
    );
  }
}