import 'package:flutter/material.dart';
import 'package:odoo_json_rpc_flutter/config/dio_factory.dart';
import 'package:odoo_json_rpc_flutter/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.computeDeviceInfo();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odoo Json-rpc Client for Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginPage(),
      home: HomePage(title: 'Odoo Json-rpc Client for Flutter'),
    );
  }
}
