import 'package:apolli/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileNotifier extends StateNotifier {
  UserProfileNotifier() : super(const User());

  final userProfileProvider =
      StateNotifierProvider((ref) => UserProfileNotifier());
}
