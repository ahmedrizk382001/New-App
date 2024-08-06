import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layouts/news_app/Cubit/Cubit.dart';
import 'package:news_app/Layouts/news_app/Cubit/States.dart';
import 'package:news_app/Modules/WebView/webview.dart';
import 'package:news_app/Shared/Components/components.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      builder: (context, state) {
        var cubit = NewsAppCubit.getInstance(context);
        return cubit.sportData.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  itemCount: cubit.businessData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WebViewScreen(
                            url: '${cubit.sportData[index]['url']}',
                            source:
                                '${cubit.sportData[index]['source']['name']}'),
                      )),
                      child: generateNews(
                          cubit.sportData[index]['urlToImage'] == null
                              ? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930'
                              : '${cubit.sportData[index]['urlToImage']}',
                          '${cubit.sportData[index]['title']}',
                          '${cubit.sportData[index]['author']}',
                          '${cubit.sportData[index]['publishedAt']}',
                          context),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return getDivider(context);
                  },
                ),
              );
      },
      listener: (context, state) {},
    );
  }
}
