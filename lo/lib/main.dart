import 'package:eotc_melodies/injection.dart' as di;
import 'package:flutter/material.dart';
import 'app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await di.init();

  runApp(const MyApp());
}
