import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPageEmployment extends StatelessWidget {
  const OnboardingPageEmployment({super.key});

  @override
  Widget build(BuildContext context) {
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
                  print(employmentOptions[itemIndex].value);
                },
                children: employmentOptions),
          ),
        ],
      ),
    );
  }
}
