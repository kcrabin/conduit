import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conduit/features/notification/presentation/screens/widgets/local_notification_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  String mtoken = "";
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Dio dio = Dio();

  TextEditingController usernameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    requestPermission();
    getToken();
    initInfo();
    super.onInit();
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      mtoken = token!;
      update();
      print('My token is $mtoken');

      saveToken(token);
    });
  }

  initInfo() {
    // var androidInitialize =
    //     const AndroidInitializationSettings('@mipmap/ic_launcher');
    // // var iosInitialize = const IOS
    // var initializationsSettings =
    //     InitializationSettings(android: androidInitialize);
    // flutterLocalNotificationsPlugin.initialize(
    //   initializationsSettings,
    // );

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        Get.toNamed("/showNotification");
      }
    });

// This method handels the notification when the app is running on foreground
// and in case of foreground notification we should display the notification
// manually in heads up display --- here this LocalNotificationService.display(message);
// method displays headsup notification when app is running in foreground.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("....................onMessage....................");
      print(
          "onMessage: ${message.notification?.title}/${message.notification?.body}");
      LocalNotificationService.display(message);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection("UserTokens").doc("User1").set({
      'token': token,
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User grented permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void sendPushMessage(String token, String body, String title) async {
    try {
      await dio.post('https://fcm.googleapis.com/fcm/send',
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization':
                  'key=AAAAam9vJx8:APA91bHKX-OpfEZHWg47qTwnAp1TD7sJxNN7AApBfn3zHSbfohKbcY34-Ibzw57DU3e57S8jVxSNME2jdH7wqUsVSH8Rw5XyhPXG2REqcarS3tlKaRDvd6YIn6VDQpAnkYrYL9AXK6fV',
            },
          ),
          data: jsonEncode(<String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            "notification": <String, dynamic>{
              "title": title,
              "body": body,
              "android_channel_id": "Conduit"
            },
            "to": token,
          }));
    } catch (e) {
      if (kDebugMode) {
        print('Error push notification');
      }
    }
  }

  sendNotification() async {
    String name = usernameController.text.trim();
    String title = titleController.text;
    String message = messageController.text;

    if (name != "") {
      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection("UserTokens")
          .doc(name)
          .get();

      String token = snap['token'];
      print(token);
      sendPushMessage(token, title, message);
    }
  }
}
