import 'package:dio/dio.dart';
import 'package:flutter_app_mock_api_test/app_dio.dart';
import 'package:flutter_app_mock_api_test/user_data_source.dart';
import 'package:flutter_app_mock_api_test/user_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

// final userListProvider = FutureProvider<List<User>>((ref) {
//   final dataSource = ref.read(userDataSourceProvider);
//   var userList = dataSource.get();
//   return userList;
// });

final userDataSourceProvider = Provider<UserDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return UserDataSource(dio);
});

final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) {
  final userApi = ref.read(userDataSourceProvider);
  return UserViewModel(userApi);
});

final dioProvider = Provider<Dio>((ref) => AppDio());
