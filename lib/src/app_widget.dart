import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Agenda Nails APP',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        colorSchemeSeed: Colors.pinkAccent.shade100,
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
