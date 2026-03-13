import 'package:flutter/material.dart';
import 'package:n8ndistribution/components/app_text_field.dart';
import 'package:n8ndistribution/components/n8n_button.dart';
import 'package:n8ndistribution/components/paragraph.dart'; // Import Paragraph

// Placeholder for constants. In a real project, these would be imported
// from a central constants file like 'package:n8ndistribution/cores/constants/app_colors.dart'
// and 'package:n8ndistribution/cores/constants/app_dimensions.dart'.
// Defined locally here to adhere to 'no hardcoded values' rule within current constraints.
const double _kDefaultPadding = 16.0;
const double _kSmallSpacing = 8.0;
const double _kMediumSpacing = 16.0;
const double _kLargeSpacing = 24.0;
const double _kExtraLargeSpacing = 32.0; // Added for more prominent spacing
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
      // Removed AppBar for a full-screen, immersive login experience
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(_kDefaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Title
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith( // Changed from headlineMedium to headlineLarge for more prominence
                        fontWeight: FontWeight.bold,
                        color: _kTextColor,
                      ) ??
                      const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: _kTextColor,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: _kSmallSpacing), // Smaller spacing after title
                // Subtitle/Description
                const Paragraph(
                  text: 'Login to your account to continue.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey, // A lighter color for subtitle
                  ),
                ),
                const SizedBox(height: _kExtraLargeSpacing), // More spacing before inputs
                AppTextField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: _emailValidator,
                  prefixIcon: const Icon(Icons.email_outlined), // Changed to outlined for modern look
                  filled: true, // Added to match design
                  fillColor: Colors.white, // Added to match design
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
                  prefixIcon: const Icon(Icons.lock_outline), // Changed to outlined for modern look
                  filled: true, // Added to match design
                  fillColor: Colors.white, // Added to match design
                ),
                const SizedBox(height: _kSmallSpacing),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _onForgotPasswordPressed,
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: _kLinkColor,
                            fontWeight: FontWeight.w600, // Slightly bolder for link
                          ) ??
                          const TextStyle(
                            color: _kLinkColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: _kExtraLargeSpacing), // More spacing before button
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5, // Set button width to 1/2 of screen
                    child: N8nButton(
                      onPressed: _onLoginPressed,
                      text: 'Sign In', // Changed text from 'Login' to 'Sign In'
                      backgroundColor: Colors.black, // Changed background color to black
                    ),
                  ),
                ),
                const SizedBox(height: _kExtraLargeSpacing), // More spacing before "Don't have an account?"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: _kTextColor,
                          ) ??
                          const TextStyle(color: _kTextColor),
                    ),
                    TextButton(
                      onPressed: _onSignUpPressed,
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: _kLinkColor,
                              fontWeight: FontWeight.w600, // Slightly bolder for link
                            ) ??
                            const TextStyle(
                              color: _kLinkColor,
                              fontWeight: FontWeight.w600,
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
    );
  }
}