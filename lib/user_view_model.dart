import 'package:flutter/material.dart';
import 'package:flutter_app_mock_api_test/user.dart';
import 'package:flutter_app_mock_api_test/user_api.dart';

class UserViewModel extends ChangeNotifier {
  final UserApi _userApi;
  final List<User> _userList = [];

  List<User> get userList => _userList;

  UserViewModel(this._userApi);

  Future<List<User>> get() {
    return _userApi.get().then((value) {
      _userList.addAll(value);
      notifyListeners();
      return _userList;
    });
  }

  putUser(User user) {
    _userApi.put(user);
    notifyListeners();
  }
}
