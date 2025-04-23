import 'package:flutter/material.dart';
import 'package:table_bookings_partner_flutter/src/screens/about_screen.dart';
import 'package:table_bookings_partner_flutter/src/screens/help_screen.dart';
import 'package:table_bookings_partner_flutter/src/screens/home_screen.dart';
import 'package:table_bookings_partner_flutter/src/screens/login.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/';
  static const String about = '/about';
  static const String help = '/help';

  static Map<String, WidgetBuilder> get routes => {
        login: (_) => const LoginScreen(),
        home: (_) => const HomeScreen(),
        about: (_) => const AboutScreen(),
        help: (_) => const HelpScreen(),
      };
}
