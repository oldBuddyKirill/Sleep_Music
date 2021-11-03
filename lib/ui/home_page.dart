import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleep_music/blocs/home_page/home_page_bloc.dart';
import 'package:sleep_music/ui/my_bottom.dart';
import 'package:sleep_music/ui/my_tile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // получаем ширину экрана
    final HomePageBloc homePageBloc = BlocProvider.of<HomePageBloc>(context);
    homePageBloc.add(StartedApplication());
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: false, // использовать вместе с SafeArea
      backgroundColor: const Color(0xFF03174D),
      appBar: AppBar(
        backgroundColor: Colors.transparent, // прозрачный
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 107.8, // 107.8 - 20
        title: const Text(
          'Sleep Music',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFE6E7F2),
            fontFamily: 'HelveticaNeueCyr',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => homePageBloc.add(OnRefreshTap()),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        bloc: homePageBloc,
        builder: (context, state) {
          if (state is HomePageShowData) {
            return _showDataListWidget(screenWidth: _screenWidth, provider: state);
          }
          if (state is HomePageError) {
            return _errorWidget(state.error);
          }
          //if (state is HomePageLoading)
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: const MyBottom(),
    );
  }
}

Center _errorWidget(Object? error) => Center(
  child: Text(
    '$error',
    style: const TextStyle(
      fontSize: 20,
      color: Color(0xFFE6E7F2),
      fontFamily: 'HelveticaNeueCyr',
      fontWeight: FontWeight.w700,
    ),
  ),
);

SingleChildScrollView _showDataListWidget(
    {required double screenWidth, required HomePageShowData provider}) =>
    SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Wrap(
            spacing: (screenWidth - 174.37 * 2) / 3, // горизонтальный отступ
            runSpacing: 20, // вертикальный отступ
            // конвертируем data в map, а потом перобразовываем в массив словарей,
            // передавая в конструктор класса MyTile значение item
            children: provider.data.map((item) => MyTile(data: item)).toList(),
          ),
        ),
      ),
    );