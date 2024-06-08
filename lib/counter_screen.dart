import 'package:blok/block/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController()
  final TextEditingController _contentController = TextEditingController()
  final Uuid uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) => 
          Text(
            'Counter: ${state.counterValue}',
            style: TextStyle(fontSize: state.fontSize),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 30,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(
            height: 30,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(ChangeFontSizeEvent());
            },
            child: Icon(Icons.text_increase),
          ),
        ],
      ),
    );
  }
}
