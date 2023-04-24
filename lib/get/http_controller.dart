import 'dart:convert';

import 'package:first_project/model/news_model.dart';
import 'package:first_project/services/news_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HttpController extends GetxController {
  var newsList = <NewsModel>[].obs;
  final ns = NewsServices();
  var loading = false.obs;
  var errorMessage = ''.obs;
  final BuildContext context;

  HttpController({required this.context});

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllNews();
    });
    super.onInit();
  }

  Future<void> getAllNews() async {
    ///loading state
    // loading.value = true;
    showLoader(context);
    errorMessage.value = "";
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
      // loading.value = false;
      Navigator.pop(context);
      newsList.value = dataList;
    } catch (e) {
      print('error in getting news : $e');

      ///error state
      // loading.value = false;
      Navigator.pop(context);
      errorMessage.value = "Something went wrong!";
    }
  }

  void onPressedButton(BuildContext context) async {
    await getAllNews();
  }

  void showLoader(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          content: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      },
    );
  }
}
