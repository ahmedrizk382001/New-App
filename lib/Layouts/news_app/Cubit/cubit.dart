import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layouts/news_app/Cubit/States.dart';
import 'package:news_app/Modules/Business/business_screen.dart';
import 'package:news_app/Modules/Science/science_screen.dart';
import 'package:news_app/Modules/Sport/sport_screen.dart';
import 'package:news_app/Shared/Network/Remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsInitialState());

  static NewsAppCubit getInstance(BuildContext context) =>
      BlocProvider.of<NewsAppCubit>(context);

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_soccer_rounded), label: "Sport"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  int bottomNavCurrentIndex = 0;

  void changeBottomNav(int index) {
    bottomNavCurrentIndex = index;
    if (bottomNavCurrentIndex == 1) {
      getSportData();
    } else if (bottomNavCurrentIndex == 2) {
      getScienceData();
    }
    emit(NewsChangeBottomNavState());
  }

  List<Widget> newsScreens = [BusinessScreen(), SportScreen(), ScienceScreen()];

  List<String> newsType = ["Business News", "Sport News", "Science News"];

  Map<String, dynamic> businessQuery = {
    'country': 'us',
    'category': 'business',
    'apikey': 'df710f8f741b42f69faecb7ecc6da369'
  };

  List<dynamic> businessData = [];

  void getBusinessData() {
    if (businessData.isEmpty) {
      emit(NewsGetBusinessDataLocadingState());
      DioHelper.get('v2/top-headlines', businessQuery).then(
        (value) {
          businessData = value.data['articles'];
          print(businessData[0]['title']);
          emit(NewsGetBusinessDataSuccessState());
        },
      ).catchError((error) {
        emit(NewsGetBusinessDataErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetBusinessDataSuccessState());
    }
  }

  Map<String, dynamic> sportQuery = {
    'country': 'us',
    'category': 'sport',
    'apikey': 'df710f8f741b42f69faecb7ecc6da369'
  };

  List<dynamic> sportData = [];

  void getSportData() {
    if (sportData.isEmpty) {
      emit(NewsGetSportDataLocadingState());
      DioHelper.get('v2/top-headlines', sportQuery).then(
        (value) {
          sportData = value.data['articles'];
          print(sportData[0]['title']);
          emit(NewsGetSportDataSuccessState());
        },
      ).catchError((error) {
        emit(NewsGetSportDataErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetSportDataSuccessState());
    }
  }

  Map<String, dynamic> scienceQuery = {
    'country': 'us',
    'category': 'science',
    'apikey': 'df710f8f741b42f69faecb7ecc6da369'
  };

  List<dynamic> scienceData = [];

  void getScienceData() {
    if (scienceData.isEmpty) {
      emit(NewsGetScienceDataLocadingState());
      DioHelper.get('v2/top-headlines', scienceQuery).then(
        (value) {
          scienceData = value.data['articles'];
          print(scienceData[0]['title']);
          emit(NewsGetScienceDataSuccessState());
        },
      ).catchError((error) {
        emit(NewsGetScienceDataErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetScienceDataSuccessState());
    }
  }

  List<dynamic> searchData = [];

  void getSearchData(String value) {
    if (value.isEmpty) {
      searchData = [];
      emit(NewsGetSearchDataSuccessState());
    } else {
      emit(NewsGetSearchDataLocadingState());
      DioHelper.get('v2/everything',
          {'q': value, 'apikey': 'df710f8f741b42f69faecb7ecc6da369'}).then(
        (value) {
          searchData = value.data['articles'];
          print(searchData[0]['title']);
          emit(NewsGetSearchDataSuccessState());
        },
      ).catchError((error) {
        emit(NewsGetSearchDataErrorState(error: error.toString()));
      });
    }
  }
}
