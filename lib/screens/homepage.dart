import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notifications/services/notification_controller.dart';
//import 'package:flutter_notifications/services/notification_controller.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_notifications/services/local_notification.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    NotificationController.initializeNotificationsListener();
  }

  createLocalNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Simple Notification',
        body: 'this is a simple notification',

        notificationLayout: NotificationLayout.Default,
        // customSound: 'resource://raw/naruto_jutsu',
        // icon: 'resource://drawable/res_naruto',

        //NotificationLayout.Default,
        // bigPicture:
        //     'https://unsplash.com/photos/vegetable-and-meat-on-bowl-kcA-c3f_3FE',
      ),
    );
  }

  createScheduledNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Scheduled Notification',
        body: 'this is a scheduled notification',
      ),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(
          Duration(seconds: 2),
        ),
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
      ),
    );

    //for repetitive notifications
    // schedule: NotificationCalendar(
    //   weekday: DateTime.monday,
    //   hour: 18,
    //   minute: 30,
    //   second: 0,
    //   millisecond: 0,
    //   allowWhileIdle: true,
    //   repeats: true,
    // ));
    // }
  }

  showActionButtonNotification(int id) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: 'basic_channel',
          title: 'Action Button Notification',
          body: 'this is an action button notification',
        ),
        actionButtons: [
          NotificationActionButton(
            key: 'READ',
            label: 'Reply',
            autoDismissible: true,
            requireInputText: true,
            // enabled: true,
          ),
          NotificationActionButton(
              key: 'ARCHIVE',
              label: 'Archive',
              autoDismissible: true,
              actionType: ActionType.SilentAction,
              isDangerousOption: true

              // enabled: true,
              ),
        ]);
  }

  cancelScheduledNotification() {
    AwesomeNotifications().cancelSchedule(10);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                'Click the button to create a notification',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                createLocalNotification();
              },
              child: Text(
                'Create Local Notification',
              ),
            ),
            ElevatedButton(
              onPressed: () => createScheduledNotification(),
              child: Text(
                'Create Scheduled Notification',
              ),
            ),
            ElevatedButton(
              onPressed: () => cancelScheduledNotification(),
              child: Text(
                'Cancel Scheduled Notification',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => showActionButtonNotification(10),
              child: Text(
                "Create an action Button Notification",
              ),
            )
          ],
        ),
      ),
    );
  }
}
