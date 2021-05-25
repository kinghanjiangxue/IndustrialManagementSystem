// @dart=2.9
//禁用健全的空安全
import 'package:universe/provider/navigation_provider.dart';
import 'package:universe/widge/nav/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:universe/widge/home/home_table_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = '深圳市齐飞达精密科技有限公司生产管理系统';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      backgroundColor: Color(0xff3875F6),
      title: Text(MyApp.title),
      centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.only(
        left: 320,
        right: 250,
        top: 0,
        bottom: 20,
      ),
      child:GenerateTable() ,
    ),
  );
}
