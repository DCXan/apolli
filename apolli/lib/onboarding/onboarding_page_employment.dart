import 'package:apolli/providers/user_profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPageEmployment extends ConsumerWidget {
  const OnboardingPageEmployment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DropdownMenuItem<String>> employmentOptions = const [
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "fullTime",
        child: Text("Employed full-time"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "partTime",
        child: Text("Employed part-time"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "unemployed",
        child: Text("Unemployed"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "student",
        child: Text("Student"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "retired",
        child: Text("Retired"),
      ),
    ];

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Text(
              'What is your employment status?',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 150,
            child: CupertinoPicker(
              itemExtent: 36,
              onSelectedItemChanged: (int itemIndex) {
                ref.read(userProfileProvider.notifier).updateUserProfile(
                    'employmentStatus', employmentOptions[itemIndex].value);
              },
              children: employmentOptions,
            ),
          ),
        ],
      ),
    );
  }
}
