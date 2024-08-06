import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layouts/news_app/Cubit/Cubit.dart';
import 'package:news_app/Layouts/news_app/Cubit/States.dart';
import 'package:news_app/Modules/WebView/webview.dart';
import 'package:news_app/Shared/Components/components.dart';
import 'package:news_app/Shared/Cubit/cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsAppCubit.getInstance(context);
        var cubit2 = AppCubit.getInstance(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Search",
              style: Theme.of(context).textTheme.headlineMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    cubit2.changeLightMode();
                  },
                  icon: const Icon(Icons.brightness_6_outlined)),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: builtTextFormField(context, validatorFunc: (value) {
                  if (value!.isEmpty) {
                    return "Please enter text";
                  }
                }, onChanged: (value) {
                  cubit.getSearchData(value);
                },
                    labelText: "search",
                    prefixIcon: const Icon(Icons.search),
                    controller: search,
                    keyboardtype: TextInputType.text),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WebViewScreen(
                                url: '${cubit.businessData[index]['url']}',
                                source:
                                    '${cubit.businessData[index]['source']['name']}'),
                          )),
                          child: generateNews(
                              cubit.searchData[index]['urlToImage'] == null
                                  ? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930'
                                  : '${cubit.searchData[index]['urlToImage']}',
                              '${cubit.searchData[index]['title']}',
                              '${cubit.searchData[index]['author']}',
                              '${cubit.searchData[index]['publishedAt']}',
                              context),
                        );
                      },
                      separatorBuilder: (context, index) => getDivider(context),
                      itemCount: cubit.searchData.length))
            ],
          ),
        );
      },
    );
  }
}
