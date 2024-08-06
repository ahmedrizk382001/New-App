import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layouts/news_app/Cubit/Cubit.dart';
import 'package:news_app/Layouts/news_app/Cubit/States.dart';
import 'package:news_app/Modules/Search/search_screen.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsAppCubit.getInstance(context);
          var cubit2 = AppCubit.getInstance(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.newsType[cubit.bottomNavCurrentIndex]),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ));
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      cubit2.changeLightMode();
                    },
                    icon: const Icon(Icons.brightness_6_outlined)),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.changeBottomNav(index);
                },
                currentIndex: cubit.bottomNavCurrentIndex,
                items: cubit.bottomItems),
            body: cubit.newsScreens[cubit.bottomNavCurrentIndex],
          );
        });
  }
}
