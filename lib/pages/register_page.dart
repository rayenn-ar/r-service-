import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/round_back_button.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool acceptTerms = false;

  @override
  void dispose() {
    nameController.dispose();
    cityController.dispose();
    phoneController.dispose();
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
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RoundBackButton(),
                      const SizedBox(height: 24),
                      const Text(
                        'Créer un compte',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Créez votre compte pour commander en quelques clics.',
                        style: TextStyle(color: AppColors.grey, fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      InputField(
                        label: 'Nom complet',
                        hint: 'Rayen Ayari',
                        controller: nameController,
                        compact: true,
                      ),
                      const SizedBox(height: 14),
                      InputField(
                        label: 'Ville',
                        hint: 'Ex : Tunis',
                        controller: cityController,
                        compact: true,
                      ),
                      const SizedBox(height: 14),
                      InputField(
                        label: 'Téléphone',
                        hint: '+216 •• ••• •••',
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        compact: true,
                      ),
                      const SizedBox(height: 14),
                      InputField(
                        label: 'Email',
                        hint: 'exemple@gmail.com',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        compact: true,
                      ),
                      const SizedBox(height: 14),
                      InputField(
                        label: 'Mot de passe',
                        hint: '8 caractères minimum',
                        controller: passwordController,
                        isPassword: true,
                        compact: true,
                      ),
                      const SizedBox(height: 14),
                      termsCheckbox(),
                      const SizedBox(height: 18),
                      PrimaryButton(
                        text: 'S\'inscrire',
                        onPressed: () {
                          // Remplace toutes les pages d'avant par l'Accueil
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              loginText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget termsCheckbox() {
    return Row(
      children: [
        SizedBox(
          width: 18,
          height: 18,
          child: Checkbox(
            value: acceptTerms,
            activeColor: AppColors.green,
            side: const BorderSide(color: AppColors.border, width: 1.5),
            onChanged: (value) {
              setState(() {
                acceptTerms = value!;
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'J\'accepte les conditions d\'utilisation',
          style: TextStyle(color: AppColors.darkGrey, fontSize: 13),
        ),
      ],
    );
  }

  Widget loginText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Déjà un compte ? ',
          style: TextStyle(color: AppColors.grey, fontSize: 14),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Se connecter',
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
