import 'package:apolli/providers/user_profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPageHomeOwnership extends ConsumerWidget {
  const OnboardingPageHomeOwnership({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DropdownMenuItem<String>> homeownerOptions = const [
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "homeowner",
        child: Text("Homeowner (Own/mortgage a home)"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "renter",
        child: Text("Renter (Rent a house/apartment/etc.)"),
      ),
      DropdownMenuItem(
        alignment: Alignment.center,
        value: "rentFree",
        child: Text("I live with family/friends."),
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
              'Which best describes your current residential status?',
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
                    'homeOwnershipStatus', homeownerOptions[itemIndex].value);
              },
              children: homeownerOptions,
            ),
          ),
        ],
      ),
    );
  }
}
