import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileNotifier extends StateNotifier<Map<String, dynamic>> {
  UserProfileNotifier() : super({});

  void updateUserProfile(key, value) {
    if (state.containsKey(key)) {
      state[key] = value;
    } else {
      state = {
        ...state,
        '$key': value,
      };
    }
    print(state);
  }
}

final userProfileProvider = StateNotifierProvider<UserProfileNotifier, Map>(
    (ref) => UserProfileNotifier());
