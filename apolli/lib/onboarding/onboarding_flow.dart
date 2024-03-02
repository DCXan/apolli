import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final _controller = PageController(initialPage: 0);

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
            children: [
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.lightGreen,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.deepPurple,
              ),
              Container(
                color: Colors.deepOrange,
              ),
            ],
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 48),
              child: SmoothPageIndicator(
                onDotClicked: (index) {
                  _goToPage(index);
                },
                controller: _controller,
                count: 5,
              ))
        ],
      ),
    );
  }
}
