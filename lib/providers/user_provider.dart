import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String _username = '';
  String _password = '';
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _error;

  String get username => _username;
  String get password => _password;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get error => _error;

  UserProvider() {
    // Load data di constructor, tapi handle error dengan try-catch
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    try {
      _isLoading = true;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      _username = prefs.getString('username') ?? '';
      _password = prefs.getString('password') ?? '';
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      _isLoading = false;
      _error = null;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      print('Error loading from prefs: $e');
    }
  }

  Future<void> login(String username, String password) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      await prefs.setString('password', password);
      await prefs.setBool('isLoggedIn', true);

      _username = username;
      _password = password;
      _isLoggedIn = true;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Login failed: $e';
      notifyListeners();
      rethrow;
    }
  }

// Tambahkan di UserProvider
  Future<void> saveToPrefs(String username, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      await prefs.setString('password', password);
      await prefs.setBool('isLoggedIn', false); // Saat register, belum login

      _username = username;
      _password = password;
      _isLoggedIn = false;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Save failed: $e';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> register(String username, String password) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      await prefs.setString('password', password);
      await prefs.setBool('isLoggedIn', false);

      _username = username;
      _password = password;
      _isLoggedIn = false;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Registration failed: $e';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> updateUser(String username, String password) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      await prefs.setString('password', password);

      _username = username;
      _password = password;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Update failed: $e';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);

      _isLoggedIn = false;
      notifyListeners();
    } catch (e) {
      _error = 'Logout failed: $e';
      notifyListeners();
      print('Error during logout: $e');
    }
  }

  Future<void> loadFromPrefs() async {
    await _loadFromPrefs();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
