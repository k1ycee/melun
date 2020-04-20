import 'package:big_field_data/Views/UI/contributions_board.dart';
import 'package:big_field_data/Views/UI/projects_board.dart';
import 'package:big_field_data/Views/UI/recommendations_board.dart';
import 'package:big_field_data/view_models/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<DashboardViewModel>.withConsumer(
        viewModel: DashboardViewModel(),
        builder: (context, model, child) => DefaultTabController(
            length: 3,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    model.navCreateFunds();
                  },
                  child: Icon(Icons.add)),
              appBar: AppBar(
                backgroundColor: Colors.blue[900],
                leading: CircleAvatar(backgroundColor: Colors.blue[100], radius: 20,),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.exit_to_app), onPressed: () => model.logOut(),),
                ],
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      child: Text('Recomendations'),
                    ),
                    Tab(
                      child: Text('My Contributions'),
                    ),
                    Tab(
                      child: Text('Projects'),
                    ),
                  ],
                ),
              ),
              body: TabBarView(children: <Widget>[
                Column(
                  children: <Widget>[Expanded(child: Recommendations())],
                ),
                Column(
                  children: <Widget>[Expanded(child: Contributions())],
                ),
                Column(
                  children: <Widget>[Expanded(child: Projects())],
                )
              ]),
           )
           )
      );
  }
}
