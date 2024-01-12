import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mehndi_order/oders.dart';

import 'firebase_options.dart';

// final theme=ThemeData(
// useMaterial3: true,
// colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark,seedColor:const Color.fromARGB(255, 131, 57,0)),
// textTheme: GoogleFonts.latoTextTheme(),
// );
var kColorScheme =
   ColorScheme.fromSeed(seedColor:const Color(0xffA1EEBD));
    // ColorScheme.fromSeed(brightness: Brightness.dark,seedColor:Color.fromARGB(255, 190, 96, 24));
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          textTheme: GoogleFonts.latoTextTheme(),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.primaryContainer)),
          // textTheme: ThemeData().textTheme.copyWith(
          //     titleLarge: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: kColorScheme.onSecondaryContainer,
          //         fontSize: 16))
        ),
        home: const Orders()
        );
  }
}


