import 'package:equatable/equatable.dart';

class OnBoardingStates extends Equatable {
  final int currentIdx;

  const OnBoardingStates({required this.currentIdx});

  @override
  List<Object?> get props => [];
/*
  OnBoardingStates({required this.currentIdx});
  @override
  List<Object> get props => [currentIdx];
  */
}

class OnBoardingChangeStates extends OnBoardingStates {
  final int currentindex;

  const OnBoardingChangeStates({required this.currentindex})
      : super(currentIdx: currentindex);

  @override
  List<Object?> get props => [currentIdx];
}

class GetOnboardingFinishedState extends OnBoardingStates {
  const GetOnboardingFinishedState() : super(currentIdx: 0);

  @override
  List<Object?> get props => [];
}

class SetOnboardingFinishedState extends OnBoardingStates {
  const SetOnboardingFinishedState() : super(currentIdx: 0);

  @override
  List<Object?> get props => [];
}

class ChoseCountryState extends OnBoardingStates {
  final int currentIndex;

  const ChoseCountryState({
    required this.currentIndex,
  }) : super(currentIdx: currentIndex);
}
class ChoseStateState extends OnBoardingStates {
  final int currentIndex;
  
  const ChoseStateState({
    required this.currentIndex,
    
  }) : super(currentIdx: currentIndex);

}
/*
abstract class OnbardingStatse extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnboardingInitialState extends OnbardingStatse {
  final int currentIndex;

  OnboardingInitialState({required this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
*/

