import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isOtpSent = false;
  String? _verificationId;
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _sendOtp() async {
    if (_phoneController.text.length < 10) {
      setState(() {
        _error = 'Please enter a valid phone number';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    // For MVP, we'll simulate OTP sending
    // In production, use Firebase Auth verifyPhoneNumber
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() {
      _isOtpSent = true;
      _isLoading = false;
      _verificationId = 'dummy_verification_id';
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP sent! Use 123456 for demo')),
      );
    }
  }

  void _verifyOtp() async {
    if (_otpController.text.length < 6) {
      setState(() {
        _error = 'Please enter a valid OTP';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    // For MVP, accept any 6-digit OTP
    await Future.delayed(const Duration(seconds: 1));

    if (_otpController.text == '123456') {
      // Navigate to home screen
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      setState(() {
        _error = 'Invalid OTP. Try 123456';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              const Icon(
                Icons.restaurant_menu,
                size: 80,
                color: AppColors.primaryRed,
              ),
              const SizedBox(height: 16),
              const Text(
                'Food Delivery',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Delicious food delivered to your door',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Phone Number Input
              if (!_isOtpSent) ...[
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'Enter your phone number',
                  ),
                ),
                const SizedBox(height: 16),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _sendOtp,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text('Send OTP'),
                        ),
                      ),
              ],

              // OTP Input
              if (_isOtpSent) ...[
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: const InputDecoration(
                    labelText: 'OTP',
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Enter OTP',
                  ),
                ),
                const SizedBox(height: 16),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _verifyOtp,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text('Verify & Login'),
                        ),
                      ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isOtpSent = false;
                      _otpController.clear();
                    });
                  },
                  child: const Text('Change Number'),
                ),
              ],

              // Error Message
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(
                  _error!,
                  style: const TextStyle(color: AppColors.primaryRed),
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: 24),
              const Text(
                'Demo OTP: 123456',
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
