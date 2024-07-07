import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/*
      // you should inialize Firebase before using FcmService 
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

 */

class FcmService {
  Future<void> init() async {
    //set the Notifications permission requests
    await _initNotificationsPermission();

    // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    if (apnsToken != null) {
      // APNS token is available, make FCM plugin API requests...
    }

    //get UserToken
    await _getToken();

    //onTokenRefresh
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
      // Error getting token.
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _handleForegroundMessages();
  }

  Future<String?> _getToken() async {
    final String? fcmToken = await FirebaseMessaging.instance.getToken(
      vapidKey: "BKagOny0KF_2pCJQ3m....moL0ewzQ8rZu",
    );
    log('token : $fcmToken');
    return fcmToken;
  }

  Future<void> _initNotificationsPermission() async {
    //set the Notifications permission requests
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

    log('User granted permission: ${settings.authorizationStatus}');
  }

  void _handleForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('notification title : ${message.notification?.title}');
        log('notification body : ${message.notification?.body}');
      }
    });
  }
}

// this function  must be a top-level function (e.g. not a class method which requires initialization).
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  log("Handling a background message: ${message.messageId}");
  log("Handling a background message: ${message.messageType}");
  log("Handling a background message: ${message.sentTime}");
}
