import '../repositrey/onboarding_repositrey.dart';

class SetStateUsecase {
  final OnboardingRepositrey onboardingRepositrey;

  SetStateUsecase({required this.onboardingRepositrey});

  Future<bool> setState(String state) {
    return onboardingRepositrey.setState(state);
  }
}
