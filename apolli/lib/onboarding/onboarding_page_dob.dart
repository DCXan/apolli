import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPageDOB extends StatelessWidget {
  const OnboardingPageDOB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'When is your birthday? \n',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 150,
            child: CupertinoDatePicker(
              onDateTimeChanged: (DateTime newDate) {
                // store user birthday(newDate)
                print(newDate);
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
