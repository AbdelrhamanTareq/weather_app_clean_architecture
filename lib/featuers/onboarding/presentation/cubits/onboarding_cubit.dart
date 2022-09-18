import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entity/onboarding.dart';
import '../../domain/usecases/get_onboarding_finished_token_usecase.dart';
import '../../domain/usecases/set_onboarding_finished_token_usecase.dart';
import '../../domain/usecases/set_state_usecase.dart';
import 'onboarding_states.dart';

class OnboardingCubit extends Cubit<OnBoardingStates> {
  final GetOnbardingFinishedTokenUsecase getOnbardingFinishedTokenUsecase;
  final SetOnbardingFinishedTokenUsecase setOnbardingFinishedTokenUsecase;
  SetStateUsecase setStateUsecase;

  OnboardingCubit({
    required this.getOnbardingFinishedTokenUsecase,
    required this.setOnbardingFinishedTokenUsecase,
    required this.setStateUsecase,
  }) : super(const OnBoardingChangeStates(currentindex: 0));

  List<Onboarding> onBoardingList = [
    const Onboarding(
      title: AppStrings.onBoardingTitle1,
      asset: AppStrings.onBoardingAsset1,
      description: AppStrings.onBoardingDescription1,
    ),
    const Onboarding(
      title: AppStrings.onBoardingTitle2,
      asset: AppStrings.onBoardingAsset2,
      description: AppStrings.onBoardingDescription2,
    ),
    const Onboarding(
      title: AppStrings.onBoardingTitle3,
      asset: AppStrings.onBoardingAsset3,
      description: AppStrings.onBoardingDescription3,
    ),
  ];

  void goNext() {
    emit(OnBoardingChangeStates(currentindex: state.currentIdx + 1));
  }

  void goBack() {
    emit(OnBoardingChangeStates(currentindex: state.currentIdx - 1));
  }

  void onPageChange(index) {
    emit(OnBoardingChangeStates(currentindex: index));
  }

  bool? getOnboardingFinishedToken() {
    emit(const GetOnboardingFinishedState());
    return getOnbardingFinishedTokenUsecase.getOnboardingFinishedToken();
  }

  void setOnboardingFinishedToken() {
    setOnbardingFinishedTokenUsecase.setOnboardingFinishedToken();
    emit(const SetOnboardingFinishedState());
  }

  void chooseCountry() {
    emit(ChoseCountryState(currentIndex: state.currentIdx));
  }

  void chooseState(String statee) {
    setStateUsecase.setState(statee);
    emit(ChoseStateState(currentIndex: state.currentIdx));
  }
}
