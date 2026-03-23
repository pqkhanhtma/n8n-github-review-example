import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8ndistribution/components/common_button.dart';
import 'package:n8ndistribution/components/common_text_field.dart';
import 'package:n8ndistribution/components/paragraph.dart';

/// A production-ready Login Screen implementing the specific blue-themed design.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _rememberMe = false;

  static const Color _brandBlue = Color(0xFF6DA7E9);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _brandBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 40),
            CommonTextField(
              label: 'Email',
              hintText: 'Enter your Email',
              controller: _emailController,
              prefixIcon: const Icon(Icons.mail_outline),
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              textColor: Colors.white,
              hintColor: Colors.white.withValues(alpha: 0.7),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            CommonTextField(
              label: 'Password',
              hintText: '******',
              controller: _passwordController,
              isPassword: true,
              obscureText: _isPasswordObscured,
              prefixIcon: const Icon(Icons.lock_outline),
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              textColor: Colors.white,
              hintColor: Colors.white.withValues(alpha: 0.7),
              onToggleVisibility: () => setState(() => _isPasswordObscured = !_isPasswordObscured),
            ),
            const SizedBox(height: 10),
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
                        onChanged: (val) => setState(() => _rememberMe = val ?? false),
                        side: const BorderSide(color: Colors.white),
                        checkColor: _brandBlue,
                        activeColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Remember me',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            CommonButton(
              text: 'LOGIN',
              backgroundColor: Colors.white,
              textColor: _brandBlue,
              borderRadius: 30,
              height: 55,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              onPressed: () {},
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.5))),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('OR', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.5))),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Sign in with',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialButton(icon: Icons.facebook, color: const Color(0xFF1877F2), onTap: () {}),
                const SizedBox(width: 20),
                _SocialButton(icon: Icons.g_mobiledata, color: Colors.red, isGoogle: true, onTap: () {}),
              ],
            ),
            const SizedBox(height: 40),
            Paragraph(
              textAlign: TextAlign.center,
              spans: [
                const TextSpan(text: "Don't have an Account ? ", style: TextStyle(color: Colors.white, fontSize: 16)),
                TextSpan(
                  text: "Sign up",
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  onEnter: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool isGoogle;

  const _SocialButton({
    required this.icon,
    required this.color,
    required this.onTap,
    this.isGoogle = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 55,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(icon, color: color, size: isGoogle ? 40 : 30),
      ),
    );
  }
}
