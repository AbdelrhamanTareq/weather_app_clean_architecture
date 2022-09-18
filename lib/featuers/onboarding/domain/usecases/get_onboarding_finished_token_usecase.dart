import '../repositrey/onboarding_repositrey.dart';

class GetOnbardingFinishedTokenUsecase {
  final OnboardingRepositrey onBoardingRepositrey;

  GetOnbardingFinishedTokenUsecase({required this.onBoardingRepositrey});

  bool? getOnboardingFinishedToken(){
   return onBoardingRepositrey.getOnboardingFinishedToken();
  }
}
