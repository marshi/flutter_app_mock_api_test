import 'package:flutter/material.dart';
import 'package:flutter_app_mock_api_test/providers.dart';
import 'package:flutter_app_mock_api_test/user_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class BodyWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(userViewModelProvider);
    print("hook");
    final userList =
        useFuture(useMemoized(() => viewModel.get()), initialData: []).data;
    print(userList);

    print("build");
    if (userList.isEmpty) {
      return Text("loading");
    }
    final items = userList.map((e) => UserItem(e.avatar, e.name)).toList();
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return items[index];
      },
    ); //SingleChildScrollView(child: widget);
  }
}
