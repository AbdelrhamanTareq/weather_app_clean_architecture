import '../errors/errors.dart';
import '../errors/failure.dart';
import 'app_strings.dart';
import '../helpers/cache_helper.dart';
import '../../injection_container.dart' as di;

bool onBoardingToken() {
  if (di.sl<CacheHelper>().getBool(AppStrings.onboardingFinishedToken) !=
      null) {
    return true;
  }
  return false;
}

String getUserState() {
  if (di.sl<CacheHelper>().getString(AppStrings.state) != null) {
    final userState =
    _filterState(di.sl<CacheHelper>().getString(AppStrings.state)!);
     //di.sl<CacheHelper>().getString(_filterState(AppStrings.state));

    return userState;
  }
  return "Cairo";
}


String _filterState(String state) {
  if(state.contains("Governorate")){
    return state.substring(0,state.indexOf(" "));
  } else {
    return state;
  }
}
String handleErrors(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailute:
        return Erorrs.serverError;
      case OfflineFailure:
        return Erorrs.noInternetError;
      case CacheFailute:
        return Erorrs.cacheError;
      case EmptyCacheFailute:
        return Erorrs.emptyCacheError;
      default:
        return Erorrs.unExpecterdError;
    }
  }
