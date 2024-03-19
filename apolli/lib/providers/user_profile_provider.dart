import 'package:apolli/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileNotifier extends StateNotifier<Object> {
  UserProfileNotifier() : super({'some key': 'some value'});

  void updateUserProfile(key, value) {
    state = {'$key': '$value'};
    print(state);
  }
}

final userProfileProvider = StateNotifierProvider<UserProfileNotifier, Object>(
    (ref) => UserProfileNotifier());
