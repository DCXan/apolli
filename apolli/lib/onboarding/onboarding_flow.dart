import 'package:apolli/onboarding/onboarding_page1.dart';
import 'package:apolli/onboarding/onboarding_page2.dart';
import 'package:apolli/onboarding/onboarding_page3.dart';
import 'package:apolli/onboarding/onboarding_page4.dart';
import 'package:apolli/onboarding/onboarding_page5.dart';
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
            children: const [
              OnboardingPage1(),
              OnboardingPage2(),
              OnboardingPage3(),
              OnboardingPage4(),
              OnboardingPage5(),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 48),
            child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                  spacing: 24,
                  dotWidth: 12,
                  dotHeight: 12,
                  dotColor: Color.fromARGB(255, 150, 150, 150),
                  activeDotColor: Color.fromARGB(255, 101, 35, 242)),
              onDotClicked: (index) {
                _goToPage(index);
              },
              controller: _controller,
              count: 5,
            ),
          )
        ],
      ),
    );
  }
}
