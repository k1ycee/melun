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
              drawer: Drawer(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text('Pffffff'),
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
            )));
  }
}
