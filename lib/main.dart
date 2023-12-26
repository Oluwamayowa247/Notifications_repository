import 'package:flutter/material.dart';
//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_notifications/screens/homepage.dart';
import 'package:flutter_notifications/services/notification_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationController.initializeLocalNotifications(debug: true);
  runApp(const MyApp());

  // AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //       channelKey: 'basic_channel',
  //       channelName: 'Basic notifications',
  //       channelDescription: 'Notification channel for basic tests',
  //       defaultColor: Color(0xFF9D50DD),
  //       importance: NotificationImportance.Max,
  //       defaultPrivacy: NotificationPrivacy.Public,
  //       defaultRingtoneType: DefaultRingtoneType.Notification,
  //       enableVibration: true,
  //       channelShowBadge: true,
  //       enableLights: true,
  //       ledColor: Colors.white,
  //       //icon: 'resource://drawable/res_naruto',
  //       // playSound: true,
  //       // soundSource: 'resource://raw/naruto_jutsu',
  //     )
  //   ],
  //   debug: true,
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(title: 'Notification Test'),
    );
  }
}
