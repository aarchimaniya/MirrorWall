import 'package:flutter/material.dart';
import 'View/Screens/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF75A47F),
        appBarTheme: const AppBarTheme(
          foregroundColor: Color(0xFFFFFF),
          backgroundColor: Color(0xFF77B0AA),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleSpacing: 1,
        ),
      ),
      // routes: AppRoutes.route,
    );
  }
}
