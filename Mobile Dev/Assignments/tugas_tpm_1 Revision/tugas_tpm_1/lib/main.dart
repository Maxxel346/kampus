import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';


// import 'home.dart';
import 'login_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkAndRequestStoragePermission();
  runApp(const MyApp());
}


Future<void> checkAndRequestStoragePermission() async {
  var status = await Permission.storage.status;

  if (status != PermissionStatus.granted) {
    // Permission hasn't been granted, request it.
    await Permission.storage.request();
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 140, 96, 218)),
        useMaterial3: true,
      ),
      home : const LoginPage(),
    );
  }
}



