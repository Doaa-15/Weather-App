import 'package:flutter/material.dart';

import 'package:weather_app/onboarding/onboarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OnboardingBody());
  }
}
