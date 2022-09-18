import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_strings.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> setOnboardingFinishToken();
  bool? getOnboardingFinishToken();
  Future<bool> setState(String state);
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  OnboardingLocalDataSourceImpl({required this.sharedPreferences});
  @override
  bool? getOnboardingFinishToken() {
    return sharedPreferences.getBool(AppStrings.onboardingFinishedToken);
  }

  @override
  Future<bool> setOnboardingFinishToken() {
    return sharedPreferences.setBool(AppStrings.onboardingFinishedToken, true);
  }

  @override
  Future<bool> setState(String state) {
    return sharedPreferences.setString(AppStrings.state, state);
  }
}
