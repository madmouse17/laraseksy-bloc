import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laraseksy_bloc/Example/example_bloc.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<ExampleBloc, ExampleState>(
            builder: (context, state) {
              return Text(state.counter.toString());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () =>
                      context.read<ExampleBloc>().add(DecrementEvent()),
                  icon: Icon(Icons.exposure_minus_1)),
              IconButton(
                  onPressed: () =>
                      context.read<ExampleBloc>().add(IncrementEvent()),
                  icon: Icon(Icons.plus_one)),
            ],
          )
        ],
      ),
    );
  }
}
