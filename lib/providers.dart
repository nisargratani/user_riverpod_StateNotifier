import 'package:demo_user/model/userdata.dart';
import 'package:demo_user/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = Provider((ref) => UserData());

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
  (ref) => UserNotifier(
    ref.watch(userDataProvider),
  ),
);

final userChangeProvider = ChangeNotifierProvider((ref) => UserChange());
