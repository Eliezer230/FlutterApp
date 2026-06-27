import 'package:flutter/material.dart';
import 'routes/rutas_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portafolio Personal',
      initialRoute: RutasApp.initialRoute,
      routes: RutasApp.getAppRoutes(),
    );
  }
}
