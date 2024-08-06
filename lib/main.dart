import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layouts/news_app/Cubit/Cubit.dart';
import 'package:news_app/Layouts/news_app/news_app_layout.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';
import 'package:news_app/Shared/Cubit/states.dart';
import 'package:news_app/Shared/Network/Local/chache_helper.dart';
import 'package:news_app/Shared/Network/Remote/dio_helper.dart';
import 'Layouts/news_app/Cubit/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getMode("isDark");
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsAppCubit()..getBusinessData()),
        BlocProvider(
            create: (context) =>
                AppCubit()..changeLightMode(fromSharedPref: isDark))
      ],
      child: BlocConsumer<AppCubit, CubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit2 = AppCubit.getInstance(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color.fromARGB(255, 237, 185, 14),
              textTheme: const TextTheme(
                headlineMedium: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                bodyMedium: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                bodyLarge: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromARGB(255, 237, 185, 14),
                elevation: 0,
                selectedIconTheme: IconThemeData(
                  color: Colors.black87,
                  size: 35,
                ),
                selectedLabelStyle: TextStyle(
                  fontSize: 15,
                ),
                selectedItemColor: Colors.black87,
              ),
              appBarTheme: const AppBarTheme(
                color: Color.fromARGB(255, 237, 185, 14),
                elevation: 0,
                titleSpacing: 20,
                actionsIconTheme: IconThemeData(
                  color: Colors.black87,
                  size: 22,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            darkTheme: ThemeData(
              unselectedWidgetColor: Colors.black54,
              primaryColor: Color.fromARGB(255, 237, 185, 14),
              textTheme: const TextTheme(
                headlineMedium: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                bodyMedium: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                bodyLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              scaffoldBackgroundColor: Color(0xff121212),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromARGB(255, 237, 185, 14),
                elevation: 0,
                selectedIconTheme: IconThemeData(
                  color: Colors.black87,
                  size: 35,
                ),
                selectedLabelStyle: TextStyle(
                  fontSize: 15,
                ),
                selectedItemColor: Colors.black87,
              ),
              appBarTheme: const AppBarTheme(
                color: Color.fromARGB(255, 237, 185, 14),
                elevation: 0,
                titleSpacing: 20,
                actionsIconTheme: IconThemeData(
                  color: Colors.black87,
                  size: 22,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            themeMode: cubit2.isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsApp(),
          );
        },
      ),
    );
  }
}
