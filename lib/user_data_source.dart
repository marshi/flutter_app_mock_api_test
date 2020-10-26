import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_app_mock_api_test/user.dart';

class UserDataSource {
  final Dio dio;

  UserDataSource(this.dio);

  Future<List<User>> get() {
    return dio
        .get<List<dynamic>>("https://5f8ab14c8453150016706147.mockapi.io/users")
        .then((response) {
      var users = response.data.map((e) => User.fromJson(e)).toList();
      return users;
    });
  }

  Future<User> put(User user) {
    dio.put(
      "https://5f8ab14c8453150016706147.mockapi.io/users/${user.id}",
      data: {"name": user.name + " put"},
    );
  }
}
