import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';
import 'cubit/light_dark_cubit.dart';
import 'cubit/list_cubit.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => LightDarkCubit()),
        BlocProvider(create: (context) => ListCubit())
      ],
      child: BlocBuilder<LightDarkCubit, /*ThemeData*/ LightDarkState>(
          builder: (context, state) {
        return MaterialApp(
          theme: state.theme,
          home: const HomePage(),
        );
      }),
    );
  }
}
