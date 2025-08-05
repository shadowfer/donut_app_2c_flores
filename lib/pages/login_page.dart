import 'package:donut_app_2c_flores/utils/button.dart';
import 'package:donut_app_2c_flores/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  // Inicio de sesión
  void signIn() async {
    // Mostrar loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    String correo = emailTextController.text.trim();
    String contrasena = passwordTextController.text.trim();

    try {
      final response = await http.post(
        Uri.parse("http://localhost:8080/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "correo": correo,
          "contrasena": contrasena,
        }),
      );

      Navigator.pop(context); // Cerrar el loading

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data["token"];

        // Guardar el token en memoria local
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("jwt_token", token);

        // Navegar a la pantalla principal
        Navigator.pushNamed(context, "/home");
      } else if (response.statusCode == 401) {
        displayMassage("Credenciales inválidas");
      } else {
        displayMassage("Error al iniciar sesión (${response.statusCode})");
      }
    } catch (e) {
      Navigator.pop(context);
      displayMassage("Error de red: $e");
    }
  }

  // Mostrar error de inicio de sesión
  void displayMassage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1e1e2e),
              Color(0xFF2d2d44),
              Color(0xFF1a1a2e),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Elementos geométricos sutiles
            Positioned(
              top: 100,
              right: 50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue.withOpacity(0.2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              left: 30,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple.withOpacity(0.2),
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Contenido principal
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Logo con marco futurista
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                                width: 1,
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.05),
                                  Colors.white.withOpacity(0.02),
                                ],
                              ),
                            ),
                            child: Image.asset(
                              "lib/images/icecream_donut.png",
                              height: 100,
                            ),
                          ),

                          const SizedBox(height: 48),

                          // Título moderno
                          Text(
                            "Bienvenido",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "Accede a tu cuenta",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w300,
                            ),
                          ),

                          const SizedBox(height: 64),

                          // Campo de email
                          Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                                width: 1,
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.05),
                                  Colors.white.withOpacity(0.02),
                                ],
                              ),
                            ),
                            child: MyTextField(
                              controller: emailTextController,
                              hintText: 'Correo electrónico',
                              obscureText: false,
                            ),
                          ),

                          // Campo de contraseña
                          Container(
                            margin: const EdgeInsets.only(bottom: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                                width: 1,
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.05),
                                  Colors.white.withOpacity(0.02),
                                ],
                              ),
                            ),
                            child: MyTextField(
                              controller: passwordTextController,
                              hintText: 'Contraseña',
                              obscureText: true,
                            ),
                          ),

                          // Botón futurista pero elegante
                          Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF4f46e5),
                                  Color(0xFF7c3aed),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF4f46e5).withOpacity(0.3),
                                  blurRadius: 16,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: MyButton(
                              onTap: signIn,
                              text: 'Iniciar Sesión',
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Línea decorativa minimalista
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Colors.white.withOpacity(0.2),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Indicadores de estado sutiles
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildDot(Colors.green),
                              const SizedBox(width: 8),
                              _buildDot(Colors.blue),
                              const SizedBox(width: 8),
                              _buildDot(Colors.purple),
                            ],
                          ),

                          const SizedBox(height: 16),

                          Text(
                            "Conexión segura",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.6),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
