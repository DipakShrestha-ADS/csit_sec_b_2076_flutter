import 'package:first_project/get/http_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HttpGetScreen extends StatelessWidget {
  const HttpGetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HttpController hc = Get.put(HttpController(
      context: context,
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Http Cubit Screen',
        ),
      ),
      body: Obx(
        () {
          final dataList = hc.newsList;
          if (dataList.isEmpty) {
            return const Center(
              child: Text('Data Empty!'),
            );
          }
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final singleArticle = dataList[index];
              return Card(
                elevation: 10,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                  ),
                  title: Text(
                    '${singleArticle.title}',
                  ),
                  subtitle: Text(
                    '${singleArticle.author}',
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: dataList.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          hc.onPressedButton(context);
        },
        child: const Icon(
          Icons.newspaper,
        ),
      ),
    );
  }
}
