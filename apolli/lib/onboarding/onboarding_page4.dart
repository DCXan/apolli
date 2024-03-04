import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage4 extends StatelessWidget {
  const OnboardingPage4({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(
              'What is the highest level of education you have completed?',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: CupertinoPicker(
                itemExtent: 36,
                onSelectedItemChanged: (int itemIndex) {},
                children: educationOptions),
          ),
        ],
      ),
    );
  }
}
