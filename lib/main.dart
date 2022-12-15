import 'package:calculate_ink_quantity/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculo Tinta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: "Tinta",
      ),
    );
  }
}
