import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(
              'Which gender do you identify with?',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150,
            // width: 200,
            child: CupertinoPicker(
                itemExtent: 36,
                onSelectedItemChanged: (int itemIndex) {},
                children: genderOptions),
          ),
        ],
      ),
    );
  }
}
