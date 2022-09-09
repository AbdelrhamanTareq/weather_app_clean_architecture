abstract class OnboardingRepositrey {
  void goNext({required int currentIndex,required int length});
  void goBack({required int currentIndex});
  void skip();
  bool?  getOnboardingFinishedToken();
  Future<bool> setOnboardingFinishedToken();
  Future<bool> setState(String state);
}
