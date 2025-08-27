import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app.dart';


Future<void> main() async {
  await dotenv.load(fileName: ".env");



//pour connecter à Firebase
//Future<void> main() async {
 //WidgetsFlutterBinding.ensureInitialized();
 //await Firebase.initializeApp(
   //options: DefaultFirebaseOptions.currentPlatform,
 //);


 //runApp(const MyApp());
//}

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


