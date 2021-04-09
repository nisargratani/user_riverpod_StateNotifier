import 'package:demo_user/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return ListView.builder(
          itemCount: watch(userChangeProvider).bookmarkedUsers.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(watch(userChangeProvider)
                      .bookmarkedUsers[index]
                      .avatarurl)),
              title:
                  Text(watch(userChangeProvider).bookmarkedUsers[index].login),
              trailing: Checkbox(
                value: true,
                onChanged: (newValue) {
                  for (int i = 0;
                      i < watch(userDataProvider).allUser.length;
                      i++) {
                    if (watch(userChangeProvider)
                            .bookmarkedUsers[index]
                            .login ==
                        watch(userDataProvider).allUser[i].login) {
                      watch(userDataProvider).allUser[i].isChecked = false;
                    }
                  }
                  watch(userChangeProvider).removeUsers(
                      watch(userChangeProvider).bookmarkedUsers[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
