import 'package:first_project/bloc/counter_bloc.dart';
import 'package:first_project/bloc/counter_event.dart';
import 'package:first_project/bloc/coutern_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('bloc screen build called');
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Screen'),
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, CounterState>(listener: (ctx, counterState) {
          print('counter state: $counterState');
        }, builder: (context, counterState) {
          print('bloc builder called: $counterState');
          if (counterState is EmptyCounterState) {
            return Text(
              '${counterState.value}',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
            );
          } else if (counterState is SuccessState) {
            return Text(
              '${counterState.value}',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
            );
          }
          return Text(
            '0',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              final cb = context.read<CounterBloc>();
              if (cb.state is EmptyCounterState) {
                cb.add(
                  IncrementCounterEvent(
                    value: (cb as EmptyCounterState).value,
                  ),
                );
              }
              cb.add(
                IncrementCounterEvent(
                  value: (cb as SuccessState).value,
                ),
              );
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
              context.read<CounterBloc>().add(
                    DecrementCounterEvent(
                      value: 20,
                    ),
                  );
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
