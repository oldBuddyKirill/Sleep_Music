//import 'dart:async'; // необходима для работы со Stream

//import 'package:sleep_music/data_repository.dart';
import 'package:sleep_music/my_bottom.dart';
import 'package:sleep_music/my_bottom_provider.dart';
import 'my_home_page_provider.dart';
import 'package:sleep_music/my_tile.dart';
import 'package:sleep_music/my_tile_data.dart';
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
        ChangeNotifierProvider<MyBottomProvider>(
            create: (context) => MyBottomProvider()),
        ChangeNotifierProvider<MyHomePageProvider>(
            create: (context) => MyHomePageProvider()),
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

/*
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // массив плиток, который вернется в будщем, а может и не вернётся(?)
  final _streamController = StreamController<List<MyTileData>?>();
  // создаём контроллер, который будет управлять потоком
  late Stream<List<MyTileData>?> _streamListMyTile;
  // создаём поток

  Future _loadData() async {
    // передаём значение null, чтобы StreamBuilder перестроился
    _streamController.add(null);
    final data = await DataRepository.getListData(); // получаем данные
    _streamController.add(data); // инициализируем наш массив
  }

  @override
  initState() {
    // обязательно вызывать до метода build
    // инициализируем поток, которым управляет этот контроллер
    _streamListMyTile = _streamController.stream;
    _loadData(); // имитируем загрузку данных
    super.initState(); // вызывается один раз
  }
  */

  @override
  Widget build(BuildContext context) {
    double _screenWidth =
        MediaQuery.of(context).size.width; // получаем ширину экрана
    return Consumer<MyHomePageProvider>(
      builder: (context, homePageProvider, child) => Scaffold(
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
              onPressed: () {
                homePageProvider.dataList;
              }, //_loadData(), TODO
              // используем анонимную функцию, вызыввающую функцию _loadData
              // onPressed: _loadData(), выдаст ошибку
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: FutureBuilder<List<MyTileData>?>(
            future: homePageProvider.dataList,
            builder: (context, snapshot) {
              // передаём AsyncWidgetBuilder; можно вызывать несколько раз
              if (snapshot.hasData) {
                // если данные получены
                return SingleChildScrollView(
                  // возможность прокрутки дочернего виджета
                  child: SafeArea(
                    child: Center(
                      child: Wrap(
                        spacing: (_screenWidth - 174.37 * 2) /
                            3, // горизонтальный отступ
                        runSpacing: 20, // вертикальный отступ
                        children: snapshot.data!
                            .map((item) => MyTile(data: item))
                            .toList(),
                        // явно указываем, что data != null
                        // конвертируем data в map, а потом перобразовываем в массив словарей,
                        // передавая в конструктор класса MyTile значение item
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                // если получена ошибка
                return Center(
                  child: Text(
                    '${snapshot.error}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFFE6E7F2),
                      fontFamily: 'HelveticaNeueCyr',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              } else {
                // By default, show a loading spinner.
                return const Center(child: CircularProgressIndicator());
              }
            }),
        /*
        StreamBuilder<List<MyTileData>?>(
            stream:
                _streamListMyTile, // данные, которые будут отображены в будущем
            builder: (context, snapshot) {
              // передаём AsyncWidgetBuilder; можно вызывать несколько раз
              if (snapshot.hasData) {
                // если данные получены
                return SingleChildScrollView(
                  // возможность прокрутки дочернего виджета
                  child: SafeArea(
                    child: Center(
                      child: Wrap(
                        // горизонтальный отступ
                        spacing: (_screenWidth - 174.37 * 2) / 3,
                        // вертикальный отступ
                        runSpacing: 20,
                        // явно указываем, что data != null
                        // конвертируем data в map, а потом перобразовываем в массив словарей,
                        // передавая в конструктор класса MyTile значение item
                        children: snapshot.data!
                            .map((item) => MyTile(data: item))
                            .toList(),
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                // если получена ошибка
                return Center(
                  child: Text(
                    '${snapshot.error}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFFE6E7F2),
                      fontFamily: 'HelveticaNeueCyr',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              } else {
                // By default, show a loading spinner.
                return const Center(child: CircularProgressIndicator());
              }
            }
            ),
        */
        bottomNavigationBar: const MyBottom(),
      ),
    );
  }
}
