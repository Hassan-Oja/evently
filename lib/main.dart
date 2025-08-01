import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/ui/auth/login/login_screen.dart';
import 'package:evently/ui/auth/register/register_screen.dart';
import 'package:evently/ui/home/tabs/Home/Add%20Event/add_event.dart';
import 'package:evently/ui/home_screen1.dart';
import 'package:evently/ui/home_screen.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
runApp( MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => LanguageProvider(),),
    ChangeNotifierProvider(create: (context) => ThemeProvider(),)
  ],
    child: const MyApp()
)
);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: AppRoutes.loginScreen,
      routes: {
         AppRoutes.homeRouteName : (context)=> HomeScreen(),
         AppRoutes.home1RouteName : (context)=> HomeScreen1(),
         AppRoutes.loginScreen : (context)=> LoginScreen(),
         AppRoutes.registerScreen : (context)=> RegisterScreen(),
         AppRoutes.addEventScreen : (context)=> AddEvent(),
      },
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme
    );
  }
}
