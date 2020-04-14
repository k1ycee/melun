import 'package:big_field_data/auth/auth.dart';
import 'package:big_field_data/locator.dart';
import 'package:big_field_data/models/user_model.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {

  final Auth auth = locator<Auth>();
  User get currentuser => auth.user;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}