import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/city_picker.dart';
import '../cubits/onboarding_cubit.dart';
import '../cubits/onboarding_states.dart';
import '../widgets/onboarding_widget.dart';
import '../../../weather/presentaion/screens/weather_screen.dart';

/*
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: _pageController,
            children: const [
              OnboardingWidget(
                url: AppStrings.onBoardingAsset1,
                desc: AppStrings.onBoardingDescription1,
                title: AppStrings.onBoardingTitle1,
              ),
              OnboardingWidget(
                url: AppStrings.onBoardingAsset2,
                desc: AppStrings.onBoardingDescription2,
                title: AppStrings.onBoardingTitle2,
              ),
              OnboardingWidget(
                url: AppStrings.onBoardingAsset3,
                desc: AppStrings.onBoardingDescription3,
                title: AppStrings.onBoardingTitle3,
              ),
            ],
          ))
      /*
             PageView(
              controller: _pageController,
              children: const [
                OnboardingWidget(
                  url: AppStrings.onBoardingAsset1,
                  desc: AppStrings.onBoardingDescription1,
                  title: AppStrings.onBoardingTitle1,
                ),
                OnboardingWidget(
                  url: AppStrings.onBoardingAsset2,
                  desc: AppStrings.onBoardingDescription2,
                  title: AppStrings.onBoardingTitle2,
                ),
                OnboardingWidget(
                  url: AppStrings.onBoardingAsset3,
                  desc: AppStrings.onBoardingDescription3,
                  title: AppStrings.onBoardingTitle3,
                ),
              ],
            ),
            */
      ,
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.bounceIn,
                );
              },
              child: const Text(AppStrings.back),
            ),
            SmoothPageIndicator(controller: _pageController, count: 3),
            TextButton(
              onPressed: () {
                _pageController.animateToPage(1,curve:Curves.linearToEaseOut,duration: Duration(milliseconds: 500));
                    
              },
              child: const Text(
                AppStrings.next,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _onBoardingList = context.read<OnboardingCubit>().onBoardingList;
    final PageController _pageController = PageController();

    //String country = '';
    return BlocBuilder<OnboardingCubit, OnBoardingStates>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(bottom: 80),
              child: PageView.builder(
                onPageChanged: (index) {
                  BlocProvider.of<OnboardingCubit>(context).onPageChange(index);
                },
                controller: _pageController,
                itemCount: _onBoardingList.length,
                itemBuilder: (_, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OnboardingWidget(
                        url: _onBoardingList[i].asset,
                        title: _onBoardingList[i].title,
                        desc: _onBoardingList[i].description,
                      ),
                      (i == _onBoardingList.length - 1)
                          ? CityPicker(
                              onStateChanged: (value) {
                                 BlocProvider.of<OnboardingCubit>(context)
                                    .chooseState(value??AppStrings.defaultCountry);
                              },
                              onCountryChanged:  (value) {
                               BlocProvider.of<OnboardingCubit>(context)
                                    .chooseCountry();
                              },
                            )
                          /*
                           CSCPicker(
                              layout: Layout.horizontal,
                              onStateChanged: (value) {
                                BlocProvider.of<OnboardingCubit>(context)
                                    .chooseState(value??"egypt");
                                  
                              },
                              onCountryChanged: (value) {
                                BlocProvider.of<OnboardingCubit>(context)
                                    .chooseCountry();
                              },
                              onCityChanged: (value) {
                                
                              },
                              showCities: false,
                            )
                            */
                          : Container()
                    ],
                  );
                },
              ),
            ),
          ),
          bottomSheet: Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: (state.currentIdx == 0)
                      ? null
                      : () {
                          BlocProvider.of<OnboardingCubit>(context).goBack();
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linearToEaseOut,
                          );
                        },
                  child: const Text(AppStrings.back),
                ),
                SmoothPageIndicator(
                    controller: _pageController, count: _onBoardingList.length),
                TextButton(
                  onPressed: (state.currentIdx == _onBoardingList.length - 1)
                      ? () {
                          BlocProvider.of<OnboardingCubit>(context)
                              .setOnboardingFinishedToken();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const WeatherScreen()));
                        }
                      : () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linearToEaseOut);
                          BlocProvider.of<OnboardingCubit>(context).goNext();
                        },
                  child: Text(
                    (state.currentIdx != _onBoardingList.length - 1)
                        ? AppStrings.next
                        : AppStrings.done,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
