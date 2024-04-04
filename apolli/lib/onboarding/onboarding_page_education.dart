import 'package:apolli/providers/user_profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPageEducation extends ConsumerWidget {
  const OnboardingPageEducation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DropdownMenuItem<String>> educationOptions = const [
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "someHighSchool",
        child: Text("Some high school, no diploma"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "highSchool",
        child: Text("High school diploma/GED"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "someCollege",
        child: Text("Some college, no degree"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "associate",
        child: Text("Associate (2-year) degree"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "bachelors",
        child: Text("Bachelor’s (4-year) degree"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "masters",
        child: Text("Master’s degree"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "doctorate",
        child: Text("Doctorate degree (PhD, MD, JD, etc.)"),
      ),
    ];

    Future(() => ref
        .read(userProfileProvider.notifier)
        .updateUserProfile('educationLevel', educationOptions[0].value));

    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What is the highest level of education you have completed?',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
            textAlign: TextAlign.center,
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
                    'educationLevel', educationOptions[itemIndex].value);
              },
              children: educationOptions,
            ),
          ),
        ],
      ),
    );
  }
}
