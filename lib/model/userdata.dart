import 'package:demo_user/model/user.dart';
import 'package:demo_user/service/network.dart';

class UserData {
  List<User> allUser = List<User>();
  Future<List<User>> getAllUsers() async {
    Network network = Network();
    dynamic data = await network.getUsers();
    for (var i in data) {
      User user = User();
      user.login = i['login'];
      user.avatarurl = i['avatar_url'];
      allUser.add(user);
    }
    return allUser;
  }
}
