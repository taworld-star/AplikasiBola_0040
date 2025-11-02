import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registration_page.dart';
import 'home_page.dart';
import 'addplayer_page.dart';
import 'saveplayer_page.dart';

void main() {
  runApp(const ArsenalApp());
}

class ArsenalApp extends StatelessWidget {
  const ArsenalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arsenal FC App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(238, 223, 11, 3), // Arsenal Yellow
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 126, 124, 14), // untuk warna tulisan dan elemen lainnya
          primary: const Color.fromARGB(255, 0, 0, 0), //unuk AppBar dan elemen utama
        ),
      ),

      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegistrationPage(),
        '/home': (context) =>  HomePage(),
        '/add_player': (context) => const AddplayerPage(),
        '/save_player': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

          if (args != null) {
            return  _savePlayerPage(playerData: args);
          } else {
            return const Scaffold(
              body: Center(
                child: Text('No player data provided.'),
              ),
            );
          }
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

