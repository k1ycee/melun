import 'package:big_field_data/Views/shared/widgets/recom_view.dart';
import 'package:big_field_data/view_models/recommendations_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';


class Recommendations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RecommendationsViewModel>.withConsumer(
      viewModel: RecommendationsViewModel(),
      onModelReady: (model) => model.listenToFunds(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: model.dash != null ? 
              ListView.builder(
                itemCount: model.dash.length,
                itemBuilder: (context, index) => GestureDetector(onTap: () => model.pay(), child:DashCard(dash: model.dash[index],))) :
                Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue),),)
            ),
          ],
        )
      ),
    );
  }
}

  