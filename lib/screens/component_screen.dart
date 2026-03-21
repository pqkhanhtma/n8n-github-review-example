import 'package:flutter/material.dart';
import 'package:n8ndistribution/components/common_button.dart';
import 'package:n8ndistribution/components/common_text_field.dart';
import 'package:n8ndistribution/components/paragraph.dart';

/// A screen that demonstrates the usage of common UI components.
/// 
/// This screen manages the local state for input fields and handles
/// user interactions via callbacks, maintaining separation of concerns.
class ComponentScreen extends StatefulWidget {
  const ComponentScreen({super.key});

  @override
  State<ComponentScreen> createState() => _ComponentScreenState();
}

class _ComponentScreenState extends State<ComponentScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handles the sign-in action.
  void _handleSignIn() {
    // Business logic stays at the screen level
    final email = _emailController.text;
    final password = _passwordController.text;
    debugPrint('Attempting sign in with: $email');
    // Implementation of actual sign in would go here (e.g., calling a Bloc or Service)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              CommonTextField(
                controller: _emailController,
                hintText: "Email or Phone Number",
                prefixIcon: const Icon(Icons.person_outline, size: 22),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (value) => debugPrint('Email changed: $value'),
              ),
              const SizedBox(height: 16),
              CommonTextField(
                controller: _passwordController,
                hintText: "Password",
                isPassword: true,
                obscureText: _isPasswordObscured,
                prefixIcon: const Icon(Icons.lock_outline, size: 22),
                textInputAction: TextInputAction.done,
                onToggleVisibility: () {
                  setState(() {
                    _isPasswordObscured = !_isPasswordObscured;
                  });
                },
                onChanged: (value) => debugPrint('Password changed'),
              ),
              const SizedBox(height: 24),
              CommonButton(
                text: "SIGN IN",
                onPressed: _handleSignIn,
              ),
              const Spacer(),
              Paragraph(
                spans: [
                  const TextSpan(text: "Don't have an account?\n"),
                  TextSpan(
                    text: "SIGN UP",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const TextSpan(
                    text: " using your email address or social media\nbelow",
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
