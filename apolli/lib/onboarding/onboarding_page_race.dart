import 'package:apolli/providers/user_profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPageRace extends ConsumerWidget {
  const OnboardingPageRace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DropdownMenuItem<String>> raceOptions = const [
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "asian",
        child: Text("Asian"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "black",
        child: Text("Black/African-American"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "hawaiian",
        child: Text("Hawaiian/Pacific Islander"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "hispanic",
        child: Text("Hispanic/Latino"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "nativeAmerican",
        child: Text("Native American/Alaska Native"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "white",
        child: Text("White/Caucasian"),
      ),
    ];

    Future(() => ref
        .read(userProfileProvider.notifier)
        .updateUserProfile('race', raceOptions[0].value));

    return Container(
      padding: const EdgeInsets.all(18),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Which race/ethnicity do you most identify as?',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 150,
            // width: 300,
            child: CupertinoPicker(
              itemExtent: 36,
              onSelectedItemChanged: (int itemIndex) {
                ref
                    .read(userProfileProvider.notifier)
                    .updateUserProfile('race', raceOptions[itemIndex].value);
              },
              children: raceOptions,
            ),
          ),
        ],
      ),
    );
  }
}
