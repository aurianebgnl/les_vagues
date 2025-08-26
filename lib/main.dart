import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());

}


//pour connecter à Firebase
//Future<void> main() async {
 //WidgetsFlutterBinding.ensureInitialized();
 //await Firebase.initializeApp(
   //options: DefaultFirebaseOptions.currentPlatform,
 //);


 //runApp(const MyApp());
//}



