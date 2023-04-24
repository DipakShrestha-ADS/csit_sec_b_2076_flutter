import 'dart:convert';

import 'package:first_project/model/news_model.dart';
import 'package:first_project/services/news_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HttpCubit extends Cubit<HttpState> {
  HttpCubit()
      : super(HttpState(
          data: {},
          newsList: [],
        ));
  NewsServices ns = NewsServices();
  void getAllNews() async {
    ///loading state
    emit(HttpState(
      data: {},
      loading: true,
      newsList: [],
    ));
    try {
      final res = await ns.getAllNews();
      final data = res.body;
      final dataMap = jsonDecode(data);
      List<NewsModel> dataList = [];
      if (dataMap.containsKey('articles')) {
        if (dataMap['articles'] != null) {
          for (var d in dataMap['articles']) {
            final nm = NewsModel.fromJson(d);
            dataList.add(nm);
          }
        }
      }
      print('data list: $dataList');

      ///success state
      emit(HttpState(
        data: dataMap,
        newsList: dataList,
      ));
    } catch (e) {
      print('error in getting news : $e');

      ///error state
      emit(HttpState(
        data: {},
        newsList: [],
        errorMessage: "Something went wrong!",
      ));
    }
  }
}

class HttpState {
  final bool loading;
  final Map<String, dynamic> data;
  final List<NewsModel> newsList;
  final String? errorMessage;

  HttpState({
    this.loading = false,
    required this.data,
    this.errorMessage,
    required this.newsList,
  });
}
