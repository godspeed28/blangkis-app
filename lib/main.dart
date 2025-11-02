import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/user_provider.dart';
import 'providers/cart_provider.dart';
import 'data/dummy_products.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/update_user_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/register_screen.dart'; 

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider(dummyProducts)),
      ],
      child: const BlangkisApp(),
    ),
  );
}

class BlangkisApp extends StatefulWidget {
  const BlangkisApp({super.key});

  @override
  State<BlangkisApp> createState() => _BlangkisAppState();
}

class _BlangkisAppState extends State<BlangkisApp> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      Provider.of<UserProvider>(context, listen: false).loadFromPrefs();
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blangkis (Blangkon Pakis)',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/dashboard': (_) => const DashboardScreen(),
        '/update-user': (_) => const UpdateUserScreen(),
        '/payment': (_) => const PaymentScreen(),
      },
    );
  }
}
