import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  Future<void> _loginWithEmail() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ingresa usuario y contraseña')));
      return;
    }

    setState(() => _loading = true);

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/api/auth/signin'),
        headers: {'Content-Type': 'application/json'},
        body: '{"username": "$email", "password": "$password"}',
      );

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(user: FirebaseAuth.instance.currentUser),
          ),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Credenciales incorrectas')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error de red')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _loading
                ? CircularProgressIndicator()
                : Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Campos de usuario y contraseña
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Usuario'),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Contraseña'),
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        icon: Icon(Icons.person),
                        label: Text('Iniciar sesión'),
                        onPressed: _loginWithEmail,
                      ),
                      SizedBox(height: 24),
                      Divider(),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        icon: Icon(Icons.login),
                        label: Text("Iniciar sesión con Google"),
                        onPressed: () async {
                          final user = await authService.signInWithGoogle();
                          if (user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomeScreen(user: user),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
