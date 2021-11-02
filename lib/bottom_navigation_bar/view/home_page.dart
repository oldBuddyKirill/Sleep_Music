import 'package:sleep_music/bottom_navigation_bar/bloc/bottom_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'counter_view.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => BottomBloc(),
     //child: ,
    );
  }

}