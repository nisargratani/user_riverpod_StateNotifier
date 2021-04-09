import 'package:demo_user/model/userdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo_user/model/user.dart';

abstract class UserState {
  const UserState();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final List<User> allUsers;
  const UserLoaded({this.allUsers});
}

class UserError extends UserState {
  final String message;
  UserError({this.message});
}

class UserNotifier extends StateNotifier<UserState> {
  final UserData userData;
  UserNotifier(this.userData) : super(UserLoading());
  Future<void> getUsers() async {
    try {
      final List<User> users = await userData.getAllUsers();
      state = UserLoaded(allUsers: users);
    } on Exception {
      state = UserError(message: 'Not fetched');
    }
  }
}

class UserChange extends ChangeNotifier {
  List<User> bookmarkedUsers = List<User>();
  void changeBookmark(User user, bool newValue) {
    user.isChecked = newValue;
    notifyListeners();
  }

  void addusers(User user) {
    bookmarkedUsers.add(user);
    notifyListeners();
  }

  void removeUsers(User user) {
    bookmarkedUsers.remove(user);
    notifyListeners();
  }
}
