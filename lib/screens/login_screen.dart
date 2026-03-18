import 'package:flutter/material.dart';
import 'package:n8ndistribution/components/app_text_field.dart';
import 'package:n8ndistribution/cores/constants/app_constants.dart';
import 'package:n8ndistribution/routes/app_route.dart';

/// A screen dedicated to user login.
///
/// This screen provides the UI for users to enter their email and password
/// to log into their account. It uses existing `AppTextField` components
/// and manages screen-level state for text input and password visibility.
/// Navigation logic for 'Forgot Password' and 'Register Now' is handled here.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handles the login button press.
  ///
  /// This method performs form validation and, if valid, would typically
  /// dispatch a login event to a Bloc or similar state management solution.
  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Implement actual login logic (e.g., dispatch Bloc event)
      debugPrint('Login attempt with:');
      debugPrint('Email: ${_emailController.text}');
      debugPrint('Password: ${_passwordController.text}');
      // Example: Navigator.of(context).pushReplacementNamed(AppRoutes.home.path);
    }
  }

  /// Toggles the visibility of the password text.
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppConstants.loginScreenBackgroundAsset, // Placeholder asset path
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppConstants.loginScreenBackgroundColor,
                child: const Center(
                  child: Text(
                    'Background Image Not Found',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
            ),
          ),
          // Overlay to darken background image and provide consistent color
          Positioned.fill(
            child: Container(
              color: AppConstants.loginScreenBackgroundColor.withOpacity(0.7),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.loginScreenHorizontalPadding,
                vertical: AppConstants.loginScreenVerticalSpacing,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppConstants.loginScreenVerticalSpacing * 2),
                    // Logo
                    Center(
                      child: Image.asset(
                        AppConstants.loginScreenLogoAsset, // Placeholder asset path
                        height: AppConstants.loginScreenLogoHeight,
                        color: AppConstants.loginScreenPrimaryTextColor, // Assuming a white logo
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: AppConstants.loginScreenLogoHeight,
                          width: AppConstants.loginScreenLogoHeight,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                          ),
                          child: const Icon(Icons.flutter_dash, color: Colors.white54, size: 48),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppConstants.loginScreenVerticalSpacing * 2),
                    // Welcome Text
                    Text(
                      'Welcome Back!',
                      style: textTheme.headlineMedium?.copyWith(
                        color: AppConstants.loginScreenPrimaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.loginScreenTitleFontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppConstants.defaultLabelBottomPadding),
                    Text(
                      'Login to your account',
                      style: textTheme.titleMedium?.copyWith(
                        color: AppConstants.loginScreenSecondaryTextColor,
                        fontSize: AppConstants.loginScreenSubtitleFontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppConstants.loginScreenVerticalSpacing * 2),
                    // Email Text Field
                    AppTextField(
                      controller: _emailController,
                      labelText: 'Email Address',
                      hintText: 'Enter your email address',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppConstants.loginScreenVerticalSpacing),
                    // Password Text Field
                    AppTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _onLoginPressed(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: AppConstants.loginScreenSecondaryTextColor,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppConstants.defaultLabelBottomPadding),
                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Navigate to forgot password screen
                          debugPrint('Forgot Password tapped');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: textTheme.bodySmall?.copyWith(
                            color: AppConstants.loginScreenPrimaryTextColor,
                            fontSize: AppConstants.loginScreenSmallTextFontSize,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppConstants.loginScreenVerticalSpacing * 2),
                    // Login Button
                    Container(
                      height: AppConstants.loginScreenButtonHeight,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppConstants.loginScreenButtonGradientStart,
                            AppConstants.loginScreenButtonGradientEnd,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(AppConstants.loginScreenButtonBorderRadius),
                      ),
                      child: MaterialButton(
                        onPressed: _onLoginPressed,
                        padding: EdgeInsets.zero, // Remove default padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.loginScreenButtonBorderRadius),
                        ),
                        child: Text(
                          'Login',
                          style: textTheme.titleMedium?.copyWith(
                            color: AppConstants.loginScreenPrimaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppConstants.loginScreenVerticalSpacing * 2),
                    // Don't have an account? Register Now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppConstants.loginScreenSecondaryTextColor,
                            fontSize: AppConstants.loginScreenSmallTextFontSize,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: Navigate to registration screen
                            debugPrint('Register Now tapped');
                          },
                          child: Text(
                            'Register Now',
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppConstants.loginScreenPrimaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstants.loginScreenSmallTextFontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
