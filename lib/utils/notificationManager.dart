// import 'dart:convert';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rumy/router/router.dart';
// import 'package:rumy/stores/issue/issueStore.dart';
// import 'package:rumy/stores/issue/myIssueListStore.dart';
// import 'package:rumy/stores/issue/teamIssueListStore.dart';
// import 'package:rumy/stores/notice/noticeStore.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// const String KEY_USER = 'userId';
// const String KEY_FCM_TOKEN = 'fcm_token';

// const String NotificationChannelId = 'RUMY_DEFAULT_NOTIFICATION_CHANNEL';
// const String NotificationChannelName = 'RumyChannel';
// const String NotificationChannelDescription = 'Rumy Notification';

// const String NotificationTypeNewIssue = 'NewIssue';
// const String NotificationTypeNewRoom = 'NewRoom';
// const String NotificationTypeNewUser = 'NewUser';
// const String NotificationTypeNewRequestedUser = 'NewRequestedUser';
// const String NotificationTypeRefusedUser = 'RefusedUser';
// const String NotificationTypeNewNote = 'NewNote';
// const String NotificationTypeNewReply = 'NewReply';
// const String NotificationTypeIssueStatus = 'IssueStatus';
// const String NotificationTypeIssueChange = 'IssueChange';
// const String NotificationTypeIssueImportant = 'IssueImportant';
// const String NotificationTypeIssueComplain = 'IssueComplain';
// const String NotificationTypeChangeReply = 'ChangeReply';
// const String NotificationTypeDeleteReply = 'DeleteReply';
// const String NotificationTypeDeleteIssue = 'DeleteIssue';
// const String NotificationTypeNewReservedIssue = 'NewReservedIssue';
// const String NotificationTypeNewNotice = 'NewNotice';
// const String NotificationTypeUpdateNotice = 'UpdateNotice';

// class NotificationManager {
//   static NotificationManager _instance;

//   static NotificationManager get instance {
//     if (_instance == null) {
//       _instance = NotificationManager._();
//     }

//     return _instance;
//   }

//   NotificationManager._();

//   static void initialize() {
//     instance.initLocalNotification();
//     instance.initFirebaseCloudMessaging();
//   }

//   NotificationDetails get platformChannelSpecifics {
//     final androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       NotificationChannelId,
//       NotificationChannelName,
//       NotificationChannelDescription,
//       importance: Importance.High,
//       priority: Priority.High,
//       ticker: 'ticker',
//       playSound: true,
//       enableVibration: true,
//       enableLights: true,
//       channelAction: AndroidNotificationChannelAction.CreateIfNotExists,
//     );

//     final iOSPlatformChannelSpecifics = IOSNotificationDetails();

//     return NotificationDetails(
//       androidPlatformChannelSpecifics,
//       iOSPlatformChannelSpecifics,
//     );
//   }

//   FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   initLocalNotification() {
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');

//     var initializationSettingsIOS = IOSInitializationSettings();

//     var initializationSettings = InitializationSettings(
//       initializationSettingsAndroid,
//       initializationSettingsIOS,
//     );

//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: onSelectNotification,
//     );
//   }

//   Future<String> getTokenFromFCM() async => await firebaseMessaging.getToken();

//   Future<String> getToken() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString(KEY_FCM_TOKEN);

//     if (token == null) {
//       token = await getTokenFromFCM();
//       sharedPreferences.setString(KEY_FCM_TOKEN, token);
//     }

//     return token;
//   }

//   Future<String> getId() async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.getString(KEY_USER);
//   }

//   Future setId(String id) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.setString(KEY_USER, id);
//   }

//   Future<dynamic> onSelectNotification(String payload) async {
//     final data = json.decode(payload);

//     if (data['data'] != null) {
//       onRoute(data['type'], data['objectId']);
//     }
//   }

//   onRoute(String type, String objectId) {
//     switch (type) {
//       case NotificationTypeNewIssue:
//       case NotificationTypeIssueStatus:
//       case NotificationTypeIssueChange:
//       case NotificationTypeIssueImportant:
//       case NotificationTypeIssueComplain:
//       case NotificationTypeNewReply:
//       case NotificationTypeChangeReply:
//         Router.toIssueDetail(objectId);
//         break;

//       case NotificationTypeDeleteIssue:
//       case NotificationTypeNewReservedIssue:
//         break;

//       case NotificationTypeNewNotice:
//       case NotificationTypeUpdateNotice:
//         Router.toNoticeDetail(objectId);
//         NoticeStore.instance.loadSingle(objectId);
//         break;
//     }
//   }

//   Future onDidReceiveLocalNotification(
//     int id,
//     String title,
//     String body,
//     String payload,
//   ) async {}

//   initFirebaseCloudMessaging() {
//     if (Platform.isIOS) {
//       requestIOSPermission();
//     }

//     firebaseMessaging.configure(
//       onBackgroundMessage: (Map<String, dynamic> message) async {
//         showNotification(message);
//       },
//       onMessage: (Map<String, dynamic> message) async {
//         showNotification(message);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         final data =
//             (Platform.isAndroid ? message['data'] : message) ?? message;

//         if (data['data'] != null) {
//           onRoute(data['type'], data['objectId']);
//         }
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         final data =
//             (Platform.isAndroid ? message['data'] : message) ?? message;

//         if (data['data'] != null) {
//           onRoute(data['type'], data['objectId']);
//         }
//       },
//     );
//   }

//   requestIOSPermission() {
//     firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(
//       sound: true,
//       badge: true,
//       alert: true,
//     ));
//   }

//   Future<void> showNotification(Map<String, dynamic> message) async {
//     final notification = message['notification'] ?? message;
//     final data = (Platform.isAndroid ? message['data'] : message) ?? message;

//     if (notification['title'] != null && notification['body'] != null) {
//       await flutterLocalNotificationsPlugin.show(
//         0,
//         notification['title'],
//         notification['body'],
//         platformChannelSpecifics,
//         payload: json.encode(data),
//       );
//     } else {
//       print(data);
//     }

//     if (data['data'] != null) {
//       switch (data['type']) {
//         case NotificationTypeNewIssue:
//         case NotificationTypeIssueStatus:
//         case NotificationTypeIssueChange:
//         case NotificationTypeIssueImportant:
//         case NotificationTypeIssueComplain:
//         case NotificationTypeNewReply:
//         case NotificationTypeChangeReply:
//           IssueStore.instance.loadIssueSingle(data['objectId']);
//           break;

//         case NotificationTypeDeleteIssue:
//         case NotificationTypeNewReservedIssue:
//           IssueStore.instance.issueMap.remove(data['objectId']);

//           if (data['teamInfo'] & 0x1 != 0) {
//             MyIssueListStore.instance.removeIssue(data['objectId']);
//           }

//           if (data['teamInfo'] & 0x2 != 0) {
//             TeamIssueListStore.instance.removeIssue(data['objectId']);
//           }
//           break;

//         case NotificationTypeNewNotice:
//         case NotificationTypeUpdateNotice:
//           NoticeStore.instance.loadSingle(data['objectId']);
//           break;
//       }
//     }
//   }
// }
