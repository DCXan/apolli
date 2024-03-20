import 'package:apolli/providers/user_profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OnboardingPageDOB extends ConsumerWidget {
  const OnboardingPageDOB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(18),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'When is your birthday? \n',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 150,
            child: CupertinoDatePicker(
              onDateTimeChanged: (DateTime newDate) {
                ref.read(userProfileProvider.notifier).updateUserProfile(
                    'dob', DateFormat.yMd().format(newDate).toString());
              },
              mode: CupertinoDatePickerMode.date,
              maximumYear: DateTime.now().year,
            ),
          ),
        ],
      ),
    );
  }
}
