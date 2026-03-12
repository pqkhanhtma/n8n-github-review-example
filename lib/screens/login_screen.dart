import 'package:flutter/material.dart';
import 'package:n8ndistribution/components/app_text_field.dart';
import 'package:n8ndistribution/components/n8n_button.dart';

// Placeholder for constants. In a real project, these would be imported
// from a central constants file like 'package:n8ndistribution/cores/constants/app_colors.dart'
// and 'package:n8ndistribution/cores/constants/app_dimensions.dart'.
// Defined locally here to adhere to 'no hardcoded values' rule within current constraints.
const double _kDefaultPadding = 16.0;
const double _kSmallSpacing = 8.0;
const double _kMediumSpacing = 16.0;
const double _kLargeSpacing = 24.0;
const Color _kPrimaryColor = Colors.blue;
const Color _kTextColor = Colors.black;
const Color _kLinkColor = Colors.blue;
const double _kDefaultBorderRadius = 8.0; // Consistent with AppTextField's internal radius

/// A screen for user login, composed of reusable components.
///
/// This screen manages its own state for password visibility and form validation.
/// Business logic for login (e.g., API calls) would be handled here, typically
/// by interacting with a Bloc or similar state management solution.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Key for form validation

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Toggles the visibility of the password text field.
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /// Handles the login button press event.
  /// Performs form validation and prints credentials for demonstration.
  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // In a production app, this would trigger a Bloc event or service call
      // to authenticate the user with _emailController.text and _passwordController.text.
      debugPrint('Attempting login with:');
      debugPrint('Email: ${_emailController.text}');
      debugPrint('Password: ${_passwordController.text}');
      // Example: context.read<AuthBloc>().add(LoginRequested(_emailController.text, _passwordController.text));
    }
  }

  /// Handles the 'Forgot Password?' link press event.
  void _onForgotPasswordPressed() {
    // In a production app, this would navigate to the forgot password screen.
    debugPrint('Forgot Password pressed');
    // Example: context.go(AppRoute.forgotPassword.path);
  }

  /// Handles the 'Sign Up' link press event.
  void _onSignUpPressed() {
    // In a production app, this would navigate to the sign up screen.
    debugPrint('Sign Up pressed');
    // Example: context.go(AppRoute.signUp.path);
  }

  /// Validator function for the email text field.
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Basic email format validation using a regex.
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validator function for the password text field.
  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(_kDefaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: _kTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: _kLargeSpacing),
                AppTextField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: _emailValidator,
                  prefixIcon: const Icon(Icons.email),
                ),
                const SizedBox(height: _kMediumSpacing),
                AppTextField(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  isPasswordField: true,
                  obscureText: _obscureText,
                  onToggleVisibility: _togglePasswordVisibility,
                  validator: _passwordValidator,
                  prefixIcon: const Icon(Icons.lock),
                ),
                const SizedBox(height: _kSmallSpacing),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _onForgotPasswordPressed,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: _kLinkColor),
                    ),
                  ),
                ),
                const SizedBox(height: _kLargeSpacing),
                N8nButton(
                  onPressed: _onLoginPressed,
                  text: 'Login',
                  backgroundColor: _kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: _kDefaultPadding),
                  borderRadius: BorderRadius.circular(_kDefaultBorderRadius),
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: _kLargeSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: _kTextColor),
                    ),
                    TextButton(
                      onPressed: _onSignUpPressed,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: _kLinkColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}