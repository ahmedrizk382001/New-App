abstract class NewsAppStates {}

class NewsInitialState extends NewsAppStates {}

class NewsChangeBottomNavState extends NewsAppStates {}

class NewsGetBusinessDataLocadingState extends NewsAppStates {}

class NewsGetBusinessDataErrorState extends NewsAppStates {
  final String error;
  NewsGetBusinessDataErrorState({required this.error});
}

class NewsGetBusinessDataSuccessState extends NewsAppStates {}

class NewsGetSportDataLocadingState extends NewsAppStates {}

class NewsGetSportDataErrorState extends NewsAppStates {
  final String error;
  NewsGetSportDataErrorState({required this.error});
}

class NewsGetSportDataSuccessState extends NewsAppStates {}

class NewsGetScienceDataLocadingState extends NewsAppStates {}

class NewsGetScienceDataErrorState extends NewsAppStates {
  final String error;
  NewsGetScienceDataErrorState({required this.error});
}

class NewsGetScienceDataSuccessState extends NewsAppStates {}

class NewsGetSearchDataLocadingState extends NewsAppStates {}

class NewsGetSearchDataErrorState extends NewsAppStates {
  final String error;
  NewsGetSearchDataErrorState({required this.error});
}

class NewsGetSearchDataSuccessState extends NewsAppStates {}
