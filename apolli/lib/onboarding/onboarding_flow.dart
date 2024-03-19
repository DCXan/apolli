import 'package:apolli/onboarding/onboarding_page_dob.dart';
import 'package:apolli/onboarding/onboarding_page_gender.dart';
import 'package:apolli/onboarding/onboarding_page_race.dart';
import 'package:apolli/onboarding/onboarding_page_education.dart';
import 'package:apolli/onboarding/onboarding_page_employment.dart';
import 'package:apolli/onboarding/onboarding_page_home_ownership.dart';
import 'package:apolli/onboarding/onboarding_page_state_residence.dart';
import 'package:apolli/ui/navbar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final _controller =
      PageController(initialPage: 0); // needed to control the page indicator

  void _goToPage(index) {
    _controller.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }

  bool onFirstPage = true;
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create your profile',
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onFirstPage = (index == 0);
                onLastPage = (index == 6);
              });
            },
            children: const [
              OnboardingPageDOB(),
              OnboardingPageGender(),
              OnboardingPageRace(),
              OnboardingPageEducation(),
              OnboardingPageEmployment(),
              OnboardingPageHomeOwnership(),
              OnboardingPageStateResidence()
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 48),
            child: SmoothPageIndicator(
              effect: const WormEffect(
                  spacing: 8,
                  dotWidth: 16,
                  dotHeight: 16,
                  dotColor: Color.fromARGB(255, 150, 150, 150),
                  activeDotColor: Color.fromARGB(255, 101, 35, 242)),
              onDotClicked: (index) {
                _goToPage(index);
              },
              controller: _controller,
              count: 7,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                onFirstPage
                    ? Expanded(
                        // will need to refactor this at some point
                        child: GestureDetector(
                          child: const Text(''),
                        ),
                      )
                    : GestureDetector(
                        child: const Text('back'),
                        onTap: () {
                          _controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                      ),
                onLastPage
                    ? GestureDetector(
                        child: const Text('finish'),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => const Navbar()));
                        },
                      )
                    : GestureDetector(
                        child: const Text('next'),
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
