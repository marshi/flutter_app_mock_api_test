import 'package:flutter_app_mock_api_test/user.dart';
import 'package:flutter_app_mock_api_test/user_api.dart';
import 'package:flutter_app_mock_api_test/user_view_model.dart';
import 'package:riverpod/riverpod.dart';

final userListProvider = FutureProvider<List<User>>((ref) {
  final userApi = UserApi();
  var userList = userApi.get();
  return userList;
});

final userApiProvider = Provider<UserApi>((ref) => UserApi());

final userViewModelProvider = Provider<UserViewModel>((ref) {
  final userApi = ref.read(userApiProvider);
  return UserViewModel(userApi);
});
