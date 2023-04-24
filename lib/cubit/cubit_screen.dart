import 'package:first_project/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('bloc screen build called');
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Screen'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, countState) {
            return Text(
              '$countState',
              style: TextStyle(
                color: Colors.red,
                fontSize: 40,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            heroTag: 'Incre',
            icon: const Icon(
              Icons.update,
            ),
            label: const Text(
              'Increase',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            heroTag: 'Decre',
            icon: const Icon(
              Icons.update,
            ),
            label: const Text(
              'Decrease',
            ),
          )
        ],
      ),
    );
  }
}
