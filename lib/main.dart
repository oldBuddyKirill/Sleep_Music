import 'package:sleep_music/my_bottom.dart';
import 'package:sleep_music/my_bottom_provider.dart';
import 'package:sleep_music/my_home_page_provider.dart';
import 'package:sleep_music/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      // иницмализируем модель провайдера.
      // провайдер будет владеть жизненным циклом счётчика,
      // вызывая метод 'dispose', когда он больше не нужен.
      // можно использовать любое слово вместо context
      providers: [
        ChangeNotifierProvider<MyBottomProvider>(create: (context) => MyBottomProvider()),
        ChangeNotifierProvider<MyHomePageProvider>(create: (context) => MyHomePageProvider()..loadDataList()),
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // получаем ширину экрана
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
            //не получится использовать Provider.of<MyHomePageProvider>(context);
            onPressed: () => context.read<MyHomePageProvider>().onRefreshTap(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Consumer<MyHomePageProvider>(
        builder: (context, homePageProvider, child) {
          if (homePageProvider.isError) {
            return _errorWidget(homePageProvider.error);
          }
          if (homePageProvider.dataList != null) {
            return _showDataListWidget(screenWidth: _screenWidth, provider: homePageProvider);
          }
          // dataList == null
          // по умолчанию показываем загрузочный спиннер
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: const MyBottom(),
    );
  }
}

Center _errorWidget (Object? error) => Center(
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

SingleChildScrollView _showDataListWidget({required double screenWidth, required MyHomePageProvider provider}) => SingleChildScrollView(
      // возможность прокрутки дочернего виджета
      child: SafeArea(
        child: Center(
          child: Wrap(
            spacing: (screenWidth - 174.37 * 2) / 3, // горизонтальный отступ
            runSpacing: 20, // вертикальный отступ
            // явно указываем, что dataList != null
            // конвертируем dataList в map, а потом перобразовываем в массив словарей,
            // передавая в конструктор класса MyTile значение item
            children: provider.dataList!.map((item) => MyTile(data: item)).toList(),
          ),
        ),
      ),
    );
