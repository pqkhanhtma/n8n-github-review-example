import 'package:flutter/material.dart';
import 'package:n8ndistribution/components/common_button.dart';
import 'package:n8ndistribution/components/n8n_text_field.dart';
import 'package:n8ndistribution/components/paragraph.dart';
import 'package:n8ndistribution/cores/constants/app_colors.dart';
import 'package:n8ndistribution/routes/app_route.dart'; // For navigation

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
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    print('Remember Me: $_rememberMe');
    // Example: Navigate to home screen
    // Navigator.of(context).pushReplacementNamed(AppRoute.home.path);
  }

  void _onForgotPasswordPressed() {
    print('Forgot Password tapped!');
    // Implement navigation to forgot password screen
  }

  void _onSignUpPressed() {
    print('Sign Up tapped!');
    // Implement navigation to sign up screen
  }

  void _onSocialLoginPressed(String platform) {
    print('$platform login tapped!');
    // Implement social login logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientBlueLight, // Lighter blue
              AppColors.gradientBlueDark, // Darker blue
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status bar spacing
              SizedBox(height: MediaQuery.of(context).padding.top + 40),

              // Sign In Title
              const Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50.0),

              // Email Label
              const Text(
                "Email",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10.0),

              // Email Input Field
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkGrey.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: N8nTextField(
                  controller: _emailController,
                  hintText: "Enter your Email",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => setState(() {}), // Trigger rebuild for potential validation (not implemented here)
                  fieldFillColor: Colors.transparent, // Background handled by Container
                  fieldBorderRadius: BorderRadius.circular(10.0),
                  fieldTextColor: AppColors.white,
                  fieldHintColor: AppColors.white.withOpacity(0.7),
                  fieldIconColor: AppColors.white,
                  showBorder: false, // No default border
                ),
              ),
              const SizedBox(height: 20.0),

              // Password Label
              const Text(
                "Password",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10.0),

              // Password Input Field
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkGrey.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: N8nTextField(
                  controller: _passwordController,
                  hintText: "******",
                  prefixIcon: Icons.lock_outline,
                  isPasswordField: true,
                  obscureText: _obscureText,
                  onChanged: (value) => setState(() {}), // Trigger rebuild
                  onSuffixIconPressed: _togglePasswordVisibility,
                  fieldFillColor: Colors.transparent, // Background handled by Container
                  fieldBorderRadius: BorderRadius.circular(10.0),
                  fieldTextColor: AppColors.white,
                  fieldHintColor: AppColors.white.withOpacity(0.7),
                  fieldIconColor: AppColors.white,
                  showBorder: false, // No default border
                ),
              ),
              const SizedBox(height: 15.0),

              // Remember me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _rememberMe = newValue ?? false;
                          });
                        },
                        activeColor: AppColors.gradientBlueDark, // Darker blue when checked
                        checkColor: AppColors.white, // White checkmark
                        side: const BorderSide(color: AppColors.white, width: 1.5), // White border when unchecked
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.0,
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
                          fontSize: 14.0,
                        ),
                        onTap: _onForgotPasswordPressed,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30.0),

              // Login Button
              CommonButton(
                text: "LOGIN",
                onPressed: _onLoginPressed,
                backgroundColor: AppColors.white,
                textColor: AppColors.gradientBlueDark,
                width: double.infinity,
                height: 50.0,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                borderRadius: BorderRadius.circular(30.0),
                padding: EdgeInsets.zero, // Padding handled by height/width
                elevation: 5.0, // Added elevation
              ),
              const SizedBox(height: 30.0),

              // - OR - Separator
              const Center(
                child: Text(
                  "- OR -",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Sign in with Text
              const Center(
                child: Text(
                  "Sign in with",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    iconText: "FB", // Using text as placeholder for icon
                    onTap: () => _onSocialLoginPressed("Facebook"),
                  ),
                  const SizedBox(width: 20.0),
                  _buildSocialButton(
                    iconText: "G", // Using text as placeholder for icon
                    onTap: () => _onSocialLoginPressed("Google"),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),

              // Don't have an Account? Sign up
              Center(
                child: Paragraph(
                  segments: [
                    const ParagraphSegment(
                      text: "Don't have an Account ? ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    ParagraphSegment(
                      text: "Sign up",
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: _onSignUpPressed,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({required String iconText, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGrey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            iconText,
            style: TextStyle(
              color: iconText == "FB" ? const Color(0xFF1877F2) : const Color(0xFFDB4437), // Facebook blue, Google red
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
