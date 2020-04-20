// import 'package:big_field_data/models/user_model.dart';
// import 'package:big_field_data/view_models/user_profile_view_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:provider_architecture/viewmodel_provider.dart';


// class ProfileView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelProvider<UserProfileViewModel>.withConsumer(
//       viewModel: UserProfileViewModel(),
//       builder: (context, model, child) => Scaffold(
//            drawer: Drawer(
//             child:ListView(children: <Widget>[
//               UserAccountsDrawerHeader(
//               accountEmail: Text('Not Available'),
//               accountName: Text('${model.user[0].fullname}'),
//               currentAccountPicture: CircleAvatar(child: CachedNetworkImage(imageUrl: model.user[1].imgUrl),),),
//               ListView(children: <Widget>[
//                   GestureDetector(
//                     onTap: () => model.logOut(),
//                     child: Text('Logout'),
//                   )
//               ],)
//             ],
//             )
//           )
//         ),     
//     );
//   }
// }