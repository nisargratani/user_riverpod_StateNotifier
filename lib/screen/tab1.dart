import 'package:demo_user/providers.dart';
import 'package:demo_user/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(userNotifierProvider);
        if (state is UserLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoaded) {
          return ListView.builder(
            itemCount: state.allUsers.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(state.allUsers[index].avatarurl),
                ),
                title: Text(state.allUsers[index].login),
                trailing: Checkbox(
                  value: state.allUsers[index].isChecked,
                  onChanged: (newValue) {
                    setState(() {
                      context
                          .read(userChangeProvider.notifier)
                          .changeBookmark(state.allUsers[index], newValue);
                    });

                    if (newValue == true) {
                      context
                          .read(userChangeProvider)
                          .addusers(state.allUsers[index]);
                    }
                    if (newValue == false) {
                      context
                          .read(userChangeProvider)
                          .removeUsers(state.allUsers[index]);
                    }
                  },
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
