import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_app/core/assets/assets.gen.dart';
import 'package:pos_app/core/components/custom_button.dart';
import 'package:pos_app/core/components/custom_text_field.dart';
import 'package:pos_app/core/constants/colors.dart';
import 'package:pos_app/core/constants/styles.dart';
import 'package:pos_app/presentation/home/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 80),
          Center(
            child: SvgPicture.asset(
              Assets.images.logo.path,
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: Text(
              'My POS App',
              style: TextStyle(
                fontSize: 36,
                fontWeight: bold,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(height: 24),
          CustomTextField(controller: emailController, label: 'Email'),
          SizedBox(height: 24),
          CustomTextField(
            controller: emailController,
            label: 'Password',
            obscureText: true,
          ),
          SizedBox(height: 24),
          CustomButton.filled(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            },
            label: 'Masuk',
          ),
        ],
      ),
    );
  }
}
