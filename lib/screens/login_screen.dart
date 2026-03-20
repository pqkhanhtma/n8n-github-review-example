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
    // Logic handled at screen level
  }

  void _onForgotPasswordPressed() {
    // Logic handled at screen level
  }

  void _onSignUpPressed() {
    // Logic handled at screen level
  }

  void _onSocialLoginPressed(String platform) {
    // Logic handled at screen level
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradientBlueLight,
                AppColors.gradientBlueDark,
              ],
            ),
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80.0),
                
                // Sign In Title
                const Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  (
                ),
                const SizedBox(height: 50.0),

                // Email Label
                const Text(
                  "Email",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10.0),

                // Email Input Field
                _buildFrostedTextField(
                  child: N8nTextField(
                    controller: _emailController,
                    hintText: "Enter your Email",
                    prefixIcon: Icons.mail_outline,
                    keyboardType: TextInputType.emailAddress,
                    fieldFillColor: Colors.transparent,
                    fieldBorderRadius: BorderRadius.circular(12.0),
                    fieldTextColor: AppColors.white,
                    fieldHintColor: AppColors.white.withOpacity(0.6),
                    fieldIconColor: AppColors.white,
                    fieldTextStyle: const TextStyle(color: AppColors.white, fontSize: 18.0),
                    showBorder: false,
                  ),
                ),
                const SizedBox(height: 20.0),

                // Password Label
                const Text(
                  "Password",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10.0),

                // Password Input Field
                _buildFrostedTextField(
                  child: N8nTextField(
                    controller: _passwordController,
                    hintText: "Enter your Password",
                    prefixIcon: Icons.lock_outline,
                    isPasswordField: true,
                    obscureText: _obscureText,
                    onSuffixIconPressed: _togglePasswordVisibility,
                    fieldFillColor: Colors.transparent,
                    fieldBorderRadius: BorderRadius.circular(12.0),
                    fieldTextColor: AppColors.white,
                    fieldHintColor: AppColors.white.withOpacity(0.6),
                    fieldIconColor: AppColors.white,
                    fieldTextStyle: const TextStyle(color: AppColors.white, fontSize: 18.0),
                    showBorder: false,
                  ),
                ),
                const SizedBox(height: 15.0),

                // Remember me & Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _rememberMe = newValue ?? false;
                              });
                            },
                            activeColor: AppColors.white,
                            checkColor: AppColors.gradientBlueDark,
                            side: const BorderSide(color: AppColors.white, width: 2.0),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: _onForgotPasswordPressed,
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.0,
                        ),
                      ),
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
                  height: 60.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 8.0,
                  shadowColor: Colors.black.withOpacity(0.15),
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
                      icon: const Icon(Icons.facebook, color: AppColors.facebookBlue, size: 30.0),
                      onTap: () => _onSocialLoginPressed("Facebook"),
                    ),
                    const SizedBox(width: 20.0),
                    _buildSocialButton(
                      icon: const Text(
                        "G",
                        style: TextStyle(
                          color: AppColors.googleRed,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => _onSocialLoginPressed("Google"),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),

                // Don't have an Account? Sign up
                Center(
                  child: Paragraph(
                    textAlign: TextAlign.center,
                    segments: [
                      const ParagraphSegment(
                        text: "Don't have an Account? ",
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
      ),
    );
  }

  Widget _buildFrostedTextField({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildSocialButton({required Widget icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(child: icon),
      ),
    );
  }
}
