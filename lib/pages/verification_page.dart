import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/round_back_button.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final codeControllers = List.generate(4, (index) => TextEditingController());
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    for (final controller in codeControllers) {
      controller.dispose();
    }
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
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
                        'Vérification',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text.rich(
                        TextSpan(
                          text: 'Code envoyé à ',
                          style: TextStyle(color: AppColors.grey, fontSize: 15),
                          children: [
                            TextSpan(
                              text: 'ra•••@gmail.com',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(child: digitBox(0)),
                          const SizedBox(width: 12),
                          Expanded(child: digitBox(1)),
                          const SizedBox(width: 12),
                          Expanded(child: digitBox(2)),
                          const SizedBox(width: 12),
                          Expanded(child: digitBox(3)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      resendText(),
                      const SizedBox(height: 24),
                      const Divider(height: 1, color: AppColors.divider),
                      const SizedBox(height: 24),
                      InputField(
                        label: 'Nouveau mot de passe',
                        hint: '8 caractères minimum',
                        controller: newPasswordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 14),
                      InputField(
                        label: 'Confirmer le mot de passe',
                        hint: '••••••••',
                        controller: confirmPasswordController,
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                text: 'Réinitialiser le mot de passe',
                onPressed: () {
                  // Retour à la page Connexion
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget digitBox(int index) {
    final isFilled = codeControllers[index].text.isNotEmpty;

    return TextField(
      controller: codeControllers[index],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      maxLength: 1,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 26,
        fontWeight: FontWeight.w800,
      ),
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isFilled ? AppColors.green : AppColors.border,
            width: isFilled ? 1.5 : 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.green, width: 1.5),
        ),
      ),
      onChanged: (value) {
        setState(() {});
        // Passe à la case suivante après avoir tapé un chiffre
        if (value.isNotEmpty && index < 3) {
          FocusScope.of(context).nextFocus();
        }
        // Revient à la case précédente après avoir effacé
        if (value.isEmpty && index > 0) {
          FocusScope.of(context).previousFocus();
        }
      },
    );
  }

  Widget resendText() {
    return Row(
      children: [
        const Text(
          'Pas reçu ? ',
          style: TextStyle(color: AppColors.grey, fontSize: 14),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Renvoyer',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Text(
          ' dans 00:42',
          style: TextStyle(color: AppColors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
