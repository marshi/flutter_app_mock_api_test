import 'package:flutter/material.dart';
import 'package:flutter_app_mock_api_test/providers.dart';
import 'package:flutter_app_mock_api_test/user.dart';
import 'package:flutter_app_mock_api_test/user_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(userViewModelProvider);

    return Consumer(
      builder: (context, watch, child) {
        return SingleChildScrollView(
          child: FutureBuilder<List<User>>(
            future: viewModel.get(),
            builder: (context, snapshot) {
              final userList = snapshot.data;
              if (userList == null) {
                return Text("loading");
              }
              final items =
                  userList.map((e) => UserItem(e.avatar, e.name)).toList();
              return Column(children: items);
            },
          ),
        );
      },
    );
  }
}
