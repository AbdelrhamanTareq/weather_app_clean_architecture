import '../repositrey/onboarding_repositrey.dart';

class SetOnbardingFinishedTokenUsecase {
  final OnboardingRepositrey onBoardingRepositrey;

  SetOnbardingFinishedTokenUsecase({required this.onBoardingRepositrey});

  void setOnboardingFinishedToken() {
    onBoardingRepositrey.setOnboardingFinishedToken();
  }
}
