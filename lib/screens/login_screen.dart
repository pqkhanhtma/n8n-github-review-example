import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8ndistribution/components/common_button.dart';
import 'package:n8ndistribution/components/n8n_text_field.dart';
import 'package:n8ndistribution/components/paragraph.dart';
import 'package:n8ndistribution/cores/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onLoginPressed() {
    // Implement login logic here
    debugPrint('Email: ${_emailController.text}');
    debugPrint('Password: ${_passwordController.text}');
  }

  void _onForgotPasswordPressed() {
    debugPrint('Forgot Password tapped!');
  }

  void _onSignUpPressed() {
    debugPrint('Sign Up tapped!');
  }

  void _onSocialLoginPressed(String platform) {
    debugPrint('$platform login tapped!');
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.loginBackground,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const SizedBox(height: 80.0),
              const Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 60.0),

              // Email Field
              const Text(
                "Email",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10.0),
              N8nTextField(
                controller: _emailController,
                hintText: "Enter your Email",
                prefixIcon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
                fieldFillColor: AppColors.white.withOpacity(0.3),
                fieldBorderRadius: BorderRadius.circular(16.0),
                fieldTextColor: AppColors.white,
                fieldHintColor: AppColors.white.withOpacity(0.6),
                fieldIconColor: AppColors.white,
                showBorder: false,
              ),
              const SizedBox(height: 25.0),

              // Password Field
              const Text(
                "Password",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10.0),
              N8nTextField(
                controller: _passwordController,
                hintText: "******",
                prefixIcon: Icons.lock_outline,
                isPasswordField: true,
                obscureText: _obscureText,
                onSuffixIconPressed: _togglePasswordVisibility,
                fieldFillColor: AppColors.white.withOpacity(0.3),
                fieldBorderRadius: BorderRadius.circular(16.0),
                fieldTextColor: AppColors.white,
                fieldHintColor: AppColors.white.withOpacity(0.6),
                fieldIconColor: AppColors.white,
                showBorder: false,
              ),
              const SizedBox(height: 15.0),

              // Action Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _rememberMe = newValue ?? false;
                            });
                          },
                          side: const BorderSide(color: AppColors.white, width: 1.5),
                          checkColor: AppColors.loginBackground,
                          activeColor: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Paragraph(
                    segments: [
                      ParagraphSegment(
                        text: "Forgot Password?",
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 15.0,
                        ),
                        onTap: _onForgotPasswordPressed,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 45.0),

              // Login Button
              CommonButton(
                text: "LOGIN",
                onPressed: _onLoginPressed,
                backgroundColor: AppColors.white,
                textColor: AppColors.loginBackground,
                width: double.infinity,
                height: 60.0,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                borderRadius: BorderRadius.circular(35.0),
                elevation: 4.0,
              ),
              const SizedBox(height: 40.0),

              // Separator Section
              const Center(
                child: Text(
                  "- OR -",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  "Sign in with",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),

              // Social Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    child: const Icon(Icons.facebook, color: Color(0xFF1877F2), size: 32),
                    onTap: () => _onSocialLoginPressed("Facebook"),
                  ),
                  const SizedBox(width: 25.0),
                  _buildSocialButton(
                    child: const Text(
                      "G",
                      style: TextStyle(
                        color: Color(0xFFDB4437),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => _onSocialLoginPressed("Google"),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),

              // Footer
              Center(
                child: Paragraph(
                  segments: [
                    const ParagraphSegment(
                      text: "Don't have an Account ? ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    ParagraphSegment(
                      text: "Sign up",
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: _onSignUpPressed,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({required Widget child, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
