import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/user_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/update_user_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/register_screen.dart';

void main() async {
  // Pastikan binding diinisialisasi sebelum runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Tidak perlu await SharedPreferences di sini
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
          lazy: false, // Buat provider segera, tidak lazy
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: const BlangkisApp(),
    ),
  );
}

class BlangkisApp extends StatelessWidget {
  const BlangkisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blangkis (Blangkon Pakis)',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/dashboard': (_) => const DashboardScreen(),
        '/update-user': (_) => const UpdateUserScreen(),
        '/payment': (_) => const PaymentScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
