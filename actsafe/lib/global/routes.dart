import 'package:actsafe/screen/initialLogin/contact/contactinfo_screen.dart';
import 'package:actsafe/screen/login/login_screen.dart';
import 'package:actsafe/screen/forms/symptom/symptom_screen.dart';
import 'package:flutter/widgets.dart';
import '../screen/forms/contact/contactinfo_screen.dart';
import '../screen/dataprivacy/dataprivacy_screen.dart';
import '../screen/forms/healthdec/healthdec_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/initialLogin/healthdec/healthdec_screen.dart';
import '../screen/initialLogin/symptom/symptom_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const LogInScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  HealthDeclarationScreen.routeName: (context) =>
      const HealthDeclarationScreen(),
  ContactInfoScreen.routeName: (context) => const ContactInfoScreen(),
  DataPrivacyScreen.routeName: (context) => const DataPrivacyScreen(),
  SymptomsScreen.routeName: (context) => const SymptomsScreen(),

  //Initial Webpages
  InitialContactInfoScreen.routeName: (context) =>
      const InitialContactInfoScreen(),
  InitialHealthDeclarationScreen.routeName: (context) =>
      const InitialHealthDeclarationScreen(),
  InitialSymptomsScreen.routeName: (context) => const InitialSymptomsScreen(),
};
