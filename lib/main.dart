import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/screens/page_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Counter Example',
      home: BlocProvider<CounterBloc>(
        create: (BuildContext context) => CounterBloc(),
        child: Page1(),
      ),
    );
  }
}
