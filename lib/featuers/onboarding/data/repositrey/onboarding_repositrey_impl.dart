import '../data_sources/onboarding_local_data_source.dart';
import '../../domain/repositrey/onboarding_repositrey.dart';

class OnBoardingRepositreyImpl implements OnboardingRepositrey {

final OnboardingLocalDataSource onboardingLocalDataSource;

  OnBoardingRepositreyImpl({required this.onboardingLocalDataSource});


  @override
  void skip() {}

  @override
  void goBack({required int currentIndex}) {
    if (currentIndex != 0) {
      currentIndex = currentIndex - 1;
    }
  }

  @override
  void goNext({required int currentIndex, required int length}) {
    if (currentIndex != length) {
      currentIndex = currentIndex + 1;
    }
  }

  @override
  bool? getOnboardingFinishedToken() {
 return   onboardingLocalDataSource.getOnboardingFinishToken();
  }

  @override
  Future<bool> setOnboardingFinishedToken() {
    return onboardingLocalDataSource.setOnboardingFinishToken();
  }

  @override
  Future<bool> setState(String state) {
   return onboardingLocalDataSource.setState(state);
  }
}
