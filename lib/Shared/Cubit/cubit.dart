import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Cubit/states.dart';
import 'package:news_app/Shared/Network/Local/chache_helper.dart';

class AppCubit extends Cubit<CubitState> {
  AppCubit() : super(InitialCubitState());

  static AppCubit getInstance(BuildContext context) =>
      BlocProvider.of<AppCubit>(context);

  bool isDark = false;

  void changeLightMode({bool? fromSharedPref}) {
    if (fromSharedPref != null) {
      isDark = fromSharedPref;
    } else {
      isDark = !isDark;
      CacheHelper.setMode("isDark", isDark);
    }
    emit(LightModeChangeState());
  }
}
