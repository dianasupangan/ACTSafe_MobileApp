import 'package:actsafe/screen/login/login_screen.dart';
import 'package:flutter/widgets.dart';
import '../screen/contact/contactinfo_screen.dart';
import '../screen/dataprivacy/dataprivacy_screen.dart';
import '../screen/healthdec/healthdec_screen.dart';
import '../screen/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const LogInScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  HealthDeclarationScreen.routeName: (context) =>
      const HealthDeclarationScreen(),
  ContactInfoScreen.routeName: (context) => const ContactInfoScreen(),
  DataPrivacyScreen.routeName: (context) => const DataPrivacyScreen(),
};
