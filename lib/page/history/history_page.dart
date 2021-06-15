import 'package:flutter/material.dart';
import 'package:universe/widget/history/history_widget.dart';
import 'package:universe/widget/history/date_picker_widget.dart';
import 'package:universe/widget/history/date_range_picker_widget.dart';
import 'package:universe/widget/history/button_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PerformancePage extends StatefulWidget {
  @override
  _PerformancePageState createState() => _PerformancePageState();
}


class _PerformancePageState extends State<PerformancePage>{



  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          String newPath = "";
          print(directory);
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/RPSApp";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
              setState(() {
                progress = value1 / value2;
              });
            });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile() async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo(
        "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
        "video.mp4");
    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  ///下载Excel日报表
  void downloadDailyExcelFile() {
    downloadFile();
    print('下载Excel日报表');
  }
  ///下载pdf日报表
  void downloadDailyPDFFile() {
    print('下载pdf日报表');
  }


  ///下载Excel月报表
  void downloadMonthExcelFile() {
    print('下载Excel月报表');
  }
  ///下载PDF月报表
  void downloadMonthPDFFile() {
    print('下载PDF月报表');
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     // backgroundColor: Colors.red,
       appBar: AppBar(
         title: Text('历史记录'),
         centerTitle: true,
         backgroundColor: Color(0xff3875F6),
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.end,
           children: <Widget>[
             SizedBox(
               height: 10,
             ),
             Container(
               child: Row(
                 // textDirection: TextDirection.ltr,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                     "日报表:",
                     style: TextStyle(
                       fontSize: 20,
                       color: Colors.black,
                     ),
                   ),
                   SizedBox(
                     width: 10,
                   ),
                   DatePickerWidget(),
                   DownloadDailyExcelWidget(
                     onClicked: () => downloadDailyExcelFile(),
                   ),
                   DownloadDailyPDFWidget(
                     onClicked: () => downloadDailyPDFFile(),
                   ),
                   SizedBox(
                     width: 100,
                   ),
                   Text(
                     "月报表:",
                     style: TextStyle(
                       fontSize: 20,
                       color: Colors.black,
                     ),
                   ),
                   SizedBox(
                     width: 10,
                   ),
                   DateRangePickerWidget(),
                   DownloadMonthExcelWidget(
                     onClicked: () => downloadMonthExcelFile(),
                   ),
                   DownloadMonthPDFWidget(
                     onClicked: () => downloadMonthPDFFile(),
                   ),

                 ],
               ),
             ),
             SizedBox(
               height: 10,
             ),
             Expanded(
               child: GenerateTable(),
             ),
           ],
         ),
       ));
  }
}
// class PerformancePage extends StatelessWidget {
//
//   @override
//   _PerformancePageState createState() => _PerformancePageState();
//
// }
//
//
// class _PerformancePageState extends State<PerformancePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }
