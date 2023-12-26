import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationController extends ChangeNotifier {
//singleton Method
  static final NotificationController _notificationController =
      NotificationController._internal();
  factory NotificationController() {
    return _notificationController;
  }
  NotificationController._internal();

  static Future<void> initializeLocalNotifications(
      {required bool debug}) async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Public,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          enableVibration: true,
          channelShowBadge: true,
          enableLights: true,
          ledColor: Colors.white,
          //icon: 'resource://drawable/res_naruto',
          // playSound: true,
          // soundSource: 'resource://raw/naruto_jutsu',
        )
      ],
      debug: true,
    );
  }

  static Future<void> initializeNotificationsListener() async {
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      // onNotificationCreatedMethod: ,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedNotification) async {
    bool isSilentAction = receivedNotification.actionType ==
            ActionType.SilentAction ||
        receivedNotification.actionType == ActionType.SilentBackgroundAction;

    debugPrint(
      'Action Received: ${isSilentAction.toString()} is recieved',
    );

    Fluttertoast.showToast(
      msg: 'Notification Recieved',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('Notification Displayed');
    Fluttertoast.showToast(
      msg: 'Notification Displayed',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('Notification Dismissed');
    Fluttertoast.showToast(
        msg: 'Notification Cancelled',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue);
  }
}
