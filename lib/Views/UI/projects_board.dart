import 'package:big_field_data/Views/shared/widgets/project_view.dart';
import 'package:big_field_data/view_models/projects_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';


class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProjectsViewModel>.withConsumer(
      viewModel: ProjectsViewModel(),
      onModelReady: (model) => model.listenToUser(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: model.prFunds!= null ? 
              ListView.builder(
                itemCount: model.prFunds.length,
                itemBuilder: (context, index) => ProjectView(user: model.prFunds[index],)) :
                Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue),),)
            ),
          ],
        )
      )
    );
  }
}