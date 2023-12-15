import 'package:flutter/material.dart';
import 'package:task_for_job/ui/pages/home/home_page.dart';
import 'package:task_for_job/ui/pages/saved_locations/saved_locations_page.dart';
import 'package:task_for_job/ui/pages/settings/settings_page.dart';
import 'package:task_for_job/ui/pages/ways/ways_page.dart';

abstract final class AppRoutes {
  static const home = "/";
  static const ways = "/ways";
  static const savedLocations = "/saved-locations";
  static const settings = "/settings";

  static final Map<String, Widget Function(BuildContext context)> routes = {
    home: (context) => const HomePage(),
    ways: (context) => const WaysPage(),
    savedLocations: (context) => const SavedLocationsPage(),
    settings: (context) => const SettingsPage(),
  };
}