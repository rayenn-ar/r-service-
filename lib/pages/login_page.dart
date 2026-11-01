import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(),
                      const SizedBox(height: 32),
                      InputField(
                        label: 'Email',
                        hint: 'exemple@gmail.com',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),
                      InputField(
                        label: 'Mot de passe',
                        hint: '••••••••',
                        controller: passwordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 18),
                      rememberAndForgot(),
                      const SizedBox(height: 26),
                      PrimaryButton(text: 'Se connecter', onPressed: () {}),
                      const SizedBox(height: 32),
                      orDivider(),
                      const SizedBox(height: 32),
                      googleButton(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              signUpText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.shopping_bag_outlined,
            size: 28,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 26),
        const Text(
          'Bon retour',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Connectez-vous pour continuer vos achats.',
          style: TextStyle(color: AppColors.grey, fontSize: 15),
        ),
      ],
    );
  }

  Widget rememberAndForgot() {
    return Row(
      children: [
        SizedBox(
          width: 18,
          height: 18,
          child: Checkbox(
            value: rememberMe,
            activeColor: AppColors.green,
            side: const BorderSide(color: AppColors.border, width: 1.5),
            onChanged: (value) {
              setState(() {
                rememberMe = value!;
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Se souvenir de moi',
          style: TextStyle(color: AppColors.darkGrey, fontSize: 14),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Mot de passe oublié ?',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget orDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: AppColors.border)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'ou',
            style: TextStyle(color: AppColors.grey, fontSize: 13),
          ),
        ),
        Expanded(child: Divider(color: AppColors.border)),
      ],
    );
  }

  Widget googleButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Continuer avec Google',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget signUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Pas encore de compte ? ',
          style: TextStyle(color: AppColors.grey, fontSize: 14),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Créer un compte',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
