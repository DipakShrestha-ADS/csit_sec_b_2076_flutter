import 'package:first_project/provider/provider_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatelessWidget {
  ProviderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('object : nuild called');
    final cn = context.watch<ProviderChangeNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Screen'),
      ),
      body: Center(
        child: Consumer<ProviderChangeNotifier>(
          builder: (context, d, child) {
            return Text(
              '${cn.value}',
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          cn.changeValue();
        },
        icon: const Icon(
          Icons.update,
        ),
        label: const Text(
          'Update Value',
        ),
      ),
    );
  }
}
