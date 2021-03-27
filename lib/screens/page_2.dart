import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  CounterBloc _counterBloc;
  int _value;

  @override
  void initState() {
    super.initState();
    _counterBloc = BlocProvider.of<CounterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exposure_minus_1_outlined),
        onPressed: () {
          _counterBloc.add(
            DecrementValueEvent(value: _value),
          );
        },
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterSuccessState) {
            _value = state.value;
            return Center(
              child: Text(
                '$_value',
                style: TextStyle(fontSize: 30.0),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
