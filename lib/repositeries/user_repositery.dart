import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/model/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(
            const User(username: "null", uid: "null", email: "null", fav: []));
}
