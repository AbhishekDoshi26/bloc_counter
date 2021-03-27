import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/screens/page_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  CounterBloc _counterBloc;
  int _value;

  @override
  void initState() {
    super.initState();
    _counterBloc = BlocProvider.of<CounterBloc>(context);
    _counterBloc.add(GetInitialValueEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: _counterBloc,
                  child: Page2(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          _counterBloc.add(
            IncrementValueEvent(value: _value),
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
                style: TextStyle(fontSize: 30),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
