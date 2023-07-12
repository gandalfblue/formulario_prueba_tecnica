import 'package:firebase_core/firebase_core.dart';

class Enviroment {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvi4hJXlY0hUAY2xmnV2JW5ngDY2wED5M',
    appId: '1:454541959049:android:f72ad03d1e203e491e4b58',
    messagingSenderId: '454541959049',
    projectId: 'marvel-env',
    databaseURL: 'https://marvel-env-default-rtdb.firebaseio.com',
    storageBucket: 'marvel-env.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDe5ipKM8MOVR-uXa9CuPv4XwZ8CwkON8',
    appId: '1:454541959049:ios:6882fbeb52d80ffc1e4b58',
    messagingSenderId: '454541959049',
    projectId: 'marvel-env',
    databaseURL: 'https://marvel-env-default-rtdb.firebaseio.com',
    storageBucket: 'marvel-env.appspot.com',
    iosClientId:
        '454541959049-7vomqbeq26uvqf33lakssbm6bjh819vi.apps.googleusercontent.com',
    iosBundleId: 'com.example.formularioPruebaTecnica',
  );

  static const String email = "qwerty@qwerty.com";

  static const String password = "123456";

  static const String token = 'AIzaSyBqVE_hetOejFEUGre9qnkakWN53gE0vfw';

  static const String baseUrl = 'marvel-env-default-rtdb.firebaseio.com';
}
