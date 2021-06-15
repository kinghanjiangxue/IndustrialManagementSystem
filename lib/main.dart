// @dart=2.9
//禁用健全的空安全
import 'package:universe/provider/navigation_provider.dart';
import 'package:universe/widget/nav/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:universe/widget/home/home_table_widget.dart';
import 'package:universe/page/home/home_pie_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = '深圳市齐飞达精密科技有限公司生产管理系统';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          localizationsDelegates:[GlobalMaterialLocalizations.delegate,GlobalWidgetsLocalizations.delegate],
          supportedLocales: [Locale('zh','CH')],
          debugShowCheckedModeBanner: false,
          title: title,
          // theme: ThemeData(primarySwatch: Colors.deepOrange),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Flex的子widget按比例来占据水平空间
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    height: MediaQuery.of(context).size.height -
                        kBottomNavigationBarHeight -
                        20,
                    // color: Colors.red,
                    child: HomePieChartPage(),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    height: MediaQuery.of(context).size.height -
                        kBottomNavigationBarHeight -
                        20,
                    child: GenerateTable(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        )
                      ],
                    ),
                    height: MediaQuery.of(context).size.height -
                        kBottomNavigationBarHeight -
                        20,
                    child: Column(
                      children: [
                        const SizedBox(height: 30.0),
                        Text(
                          "产量排名",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            height: 1.2,
                            fontFamily: "Courier",
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Image.asset(
                          // 皇冠标识
                          'images/champion.png',
                          width: 200,
                          height: 200,
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              // 皇冠标识
                              'images/first.png',
                              width: 90,
                              height: 90,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "楚留香",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                height: 1.2,
                                fontFamily: "Courier",
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              // 皇冠标识
                              'images/second.png',
                              width: 90,
                              height: 90,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "古龙",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                height: 1.2,
                                fontFamily: "Courier",
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              // 皇冠标识
                              'images/third.png',
                              width: 90,
                              height: 90,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "梁羽生",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                height: 1.2,
                                fontFamily: "Courier",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
