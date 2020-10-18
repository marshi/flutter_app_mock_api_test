import 'package:flutter_app_mock_api_test/user.dart';
import 'package:flutter_app_mock_api_test/user_api.dart';
import 'package:riverpod/riverpod.dart';

final userListProvider = FutureProvider<List<User>>((ref) {
  final userApi = UserApi();
  var userList = userApi.get();
  return userList;
});
