import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleep_music/blocs/bottom_navigation/bottom_bloc.dart';
import 'package:sleep_music/blocs/home_page/home_page_bloc.dart';
import 'package:sleep_music/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BottomBloc(),
        ),
        BlocProvider(
          create: (_) => HomePageBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}