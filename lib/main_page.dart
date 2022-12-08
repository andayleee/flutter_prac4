import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prac4/cubit/counter_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/light_dark_cubit.dart';
import 'cubit/list_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () {
                      if (context.read<LightDarkCubit>().state.theme ==
                          ThemeData.light()) {
                        context.read<CounterCubit>().increment();
                        context.read<ListCubit>().addHistory("+  1");
                      } else {
                        context.read<CounterCubit>().increment();
                        context.read<CounterCubit>().increment();
                        context.read<ListCubit>().addHistory("+  2");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 25),
                    )),
                BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                  return Center(
                      child: Text(
                    '${state.count}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ));
                }),
                ElevatedButton(
                    onPressed: () {
                      if (context.read<LightDarkCubit>().state.theme ==
                          ThemeData.light()) {
                        context.read<CounterCubit>().decrement();
                        context.read<ListCubit>().addHistory("-  1");
                      } else {
                        context.read<CounterCubit>().decrement();
                        context.read<CounterCubit>().decrement();
                        context.read<ListCubit>().addHistory("-  2");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 25),
                    ))
              ]),
              Expanded(
                child: SizedBox(
                    height: 500.0,
                    child: BlocBuilder<ListCubit, ListInitial>(
                        builder: (context, state) {
                      return ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount:
                              context.read<ListCubit>().state.history.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      index.toString(),
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${context.read<ListCubit>().state.history[index]}',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ]);
                          });
                    })),
              ),
            ]),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<LightDarkCubit>().switchTheme();
                if (context.read<LightDarkCubit>().state.theme ==
                    ThemeData.light())
                  context.read<ListCubit>().addHistory("☼");
                else
                  context.read<ListCubit>().addHistory("☽");
              },
              tooltip: 'Switch Theme',
              child: context.read<LightDarkCubit>().state.theme ==
                      ThemeData.light()
                  ? const Icon(Icons.insert_emoticon_rounded)
                  : const Icon(Icons.emoji_emotions_outlined),
            ),
          ],
        ));
  }
}
