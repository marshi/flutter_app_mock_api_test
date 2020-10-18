import 'package:flutter/material.dart';
import 'package:flutter_app_mock_api_test/providers.dart';
import 'package:flutter_app_mock_api_test/user.dart';
import 'package:flutter_app_mock_api_test/user_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(userViewModelProvider);
    viewModel.get();
    return Consumer(
      builder: (context, watch, child) {
        List<User> userList = watch(userViewModelProvider).userList;
        Widget widget;
        if (userList.isEmpty) {
          widget = Text("loading");
        } else {
          final items =
              userList.map((e) => UserItem(e.avatar, e.name)).toList();
          widget = Column(children: items);
        }
        return SingleChildScrollView(child: widget);
      },
    );
  }
}
