import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sales_purchase_app/core/services/shared_pref_service.dart';

class FcmService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final Dio dio = Dio();

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {},
    );

    final fcmToken = await _firebaseMessaging.getToken();
    final isAuthToken = await SharedPrefService.isAuthToken();
    log('FCM Token : $fcmToken');
    if (isAuthToken) {
      if (fcmToken != null) {
        await _updateFcmToken(fcmToken);
      } else {
        log('FCM Token not found');
      }
    } else {
      log('Auth Token not found');
    }

    FirebaseMessaging.onMessage.listen(_firebaseForegroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_firebaseBackgroundHandler);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await _firebaseMessaging.getInitialMessage();
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'com.adr.sales_purchase_app',
        'app',
        importance: Importance.max,
      ),
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> _firebaseForegroundHandler(RemoteMessage message) async {
    log('FCM Message: ${message.notification?.title} - ${message.notification?.body}');
    await showNotification(
      id: 0,
      title: message.notification?.title ?? 'No Title',
      body: message.notification?.body ?? 'No Body',
    );
  }

  Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    log('FCM Background Message: ${message.notification?.title} - ${message.notification?.body}');
    await showNotification(
      id: 0,
      title: message.notification?.title ?? 'No Title',
      body: message.notification?.body ?? 'No Body',
    );
  }

  Future<void> _updateFcmToken(String fcmToken) async {
    try {
      final String? authToken = await SharedPrefService.getAuthToken();
      if (authToken != null) {
        final response = await dio.post(
          'https://testingpurchasing.kopramandiri.com/api/sales-request/save-fcm-token',
          data: {
            'fcm_token': fcmToken,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer $authToken',
            },
          ),
        );

        if (response.statusCode == 200) {
          log('FCM Token successfully sent');
        } else {
          log('Failed to send FCM Token, status: ${response.statusCode}');
        }
      }
    } catch (e) {
      log('Error sending FCM token: $e');
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await FcmService()._firebaseBackgroundHandler(message);
}
