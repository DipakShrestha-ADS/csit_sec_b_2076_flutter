import 'package:first_project/httpCubit/http_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HttpCubitScreen extends StatelessWidget {
  const HttpCubitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Http Cubit Screen',
        ),
      ),
      body: BlocConsumer<HttpCubit, HttpState>(
        listener: (ctx, httpState) {
          print('http state : ${httpState}');
          if (httpState.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${httpState.errorMessage}',
                ),
              ),
            );
          }
        },
        builder: (context, httpState) {
          if (httpState.loading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.blue,
              ),
            );
          }
          final dataList = httpState.newsList;
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
          context.read<HttpCubit>().getAllNews();
        },
        child: const Icon(
          Icons.newspaper,
        ),
      ),
    );
  }
}
