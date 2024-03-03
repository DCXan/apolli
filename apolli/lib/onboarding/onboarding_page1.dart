import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'When is your birthday?',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              onDateTimeChanged: (DateTime newDate) {
                // store user birthday
              },
              mode: CupertinoDatePickerMode.date,
              maximumYear: DateTime.now().year,
            ),
          )
        ],
      ),
    );
  }
}
