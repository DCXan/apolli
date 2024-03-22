import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:us_states/us_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apolli/providers/user_profile_provider.dart';

class OnboardingPageStateResidence extends ConsumerWidget {
  const OnboardingPageStateResidence({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List usStatesAndTerritories = USStates.getAllNames();

    final List<DropdownMenuItem<String>> stateOptions = [];

    final List<String> nonStates = [
      'American Samoa',
      'District of Columbia',
      'Guam',
      'Puerto Rico',
      'Virgin Islands'
    ];

    for (var state in usStatesAndTerritories) {
      if (nonStates.contains(state)) {
        continue;
      }

      stateOptions.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: state.toString().toLowerCase(),
          child: Text(state),
        ),
      );
    }

    Future(() => ref
        .read(userProfileProvider.notifier)
        .updateUserProfile('stateResidence', stateOptions[0].value));

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
              'Which U.S. state do you live in?',
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
                    'stateResidence', stateOptions[itemIndex].value);
              },
              children: stateOptions,
            ),
          ),
        ],
      ),
    );
  }
}
