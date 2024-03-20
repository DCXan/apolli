import 'package:apolli/providers/user_profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPageGender extends ConsumerWidget {
  const OnboardingPageGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DropdownMenuItem<String>> genderOptions = const [
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "male",
        child: Text("Male"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "female",
        child: Text("Female"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "nonbinary",
        child: Text("Non-Binary"),
      ),
    ];
    Future(() => ref
        .read(userProfileProvider.notifier)
        .updateUserProfile('gender', genderOptions[0].value));
        
    return Container(
      padding: const EdgeInsets.all(18),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Text(
              'Which gender do you identify with?',
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
                    'gender', genderOptions[itemIndex].value);
              },
              children: genderOptions,
            ),
          ),
        ],
      ),
    );
  }
}
