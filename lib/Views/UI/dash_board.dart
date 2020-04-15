import 'package:big_field_data/Views/shared/dash_view.dart';
import 'package:big_field_data/constants/routes.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/services/navigation_services.dart';
import 'package:big_field_data/view_models/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';



class Dashboard extends StatelessWidget {

  final NavigationService navto = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<DashboardViewModel>.withConsumer(
      viewModel: DashboardViewModel(), 
      builder: (context,model,child) => DefaultTabController(
          length: 3,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                navto.navigateTo(CreateFundsRoute);
              },
              child: Icon(Icons.add)
            ),
            appBar: AppBar(bottom: TabBar(tabs: <Widget>[
                    Tab(child: Text('Recomendations'),),
                    Tab(child: Text('My Contributions'),),
                    Tab(child: Text('Projects'),),
            ],
            ),
          ),
          drawer: Drawer(child: Container(alignment: Alignment.bottomCenter,child: Text('Pffffff'),),),
          body: TabBarView(children: <Widget>[
            Column(children: <Widget>[
            Expanded(child: model.dash != null ?
            ListView.builder(
              itemCount: model.dash.length,
              itemBuilder: (context,index) => DashCard()) : Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),),
              )
            ) 
            ],),
            Column(children: <Widget>[
            Expanded(child: model.dash != null ?
            ListView.builder(
              itemCount: model.dash.length,
              itemBuilder: (context,index) => DashCard()) : Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),),
              )
            ) 
            ],),
            Column(children: <Widget>[
            Expanded(child: model.dash != null ?
            ListView.builder(
              itemCount: model.dash.length,
              itemBuilder: (context,index) => DashCard()) : Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),),
              )
            ) 
            ],)
          ],),
        ),
      )
    );
  }
}