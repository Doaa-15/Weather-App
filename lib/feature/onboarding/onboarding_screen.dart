import 'package:flutter/material.dart';

import 'package:weather_app/feature/onboarding/onboarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OnboardingBody());
  }
}
