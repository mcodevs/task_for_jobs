import 'package:flutter/material.dart';
import 'package:task_for_job/common/config/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Job Task",
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
