import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_for_job/common/widget/app.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MapModelAdapter());
  await Hive.openBox("locations");
  await Hive.box("locations").clear();
  runApp(const App());
}