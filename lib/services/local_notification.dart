import 'package:awesome_notifications/awesome_notifications.dart';

class LocalNotifications {
  static createScheduledNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Scheduled Notification',
        body: 'this is a scheduled notification',
      ),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(
          Duration(minutes: 2),
        ),
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }

  static createLocalNotification() {
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

  static cancelScheduledNotification(int id) {
    AwesomeNotifications().cancelSchedule(id);
  }
}
