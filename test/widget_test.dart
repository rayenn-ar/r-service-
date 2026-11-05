import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:r_serrvice/constants/app_colors.dart';
import 'package:r_serrvice/main.dart';

void main() {
  testWidgets('La page Splash s\'affiche', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('R-service'), findsOneWidget);
    expect(find.text('Commencer mes achats'), findsOneWidget);
  });

  testWidgets('Le bouton du Splash ouvre l\'Onboarding', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Commencer mes achats'));
    await tester.pumpAndSettle();

    expect(find.text('Des milliers de produits'), findsOneWidget);
    expect(find.text('Passer'), findsOneWidget);
    expect(find.text('Suivant'), findsOneWidget);
  });

  testWidgets('Suivant ouvre la page Connexion', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Commencer mes achats'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Suivant'));
    await tester.pumpAndSettle();

    expect(find.text('Bon retour'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });

  testWidgets("Créer un compte ouvre l'Inscription puis retour", (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Commencer mes achats'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Suivant'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Créer un compte'));
    await tester.pumpAndSettle();
    expect(find.text("S'inscrire"), findsOneWidget);

    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();
    expect(find.text('Bon retour'), findsOneWidget);
  });

  testWidgets("Mot de passe oublié s'ouvre depuis la Connexion", (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Commencer mes achats'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Suivant'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Mot de passe oublié ?'));
    await tester.pumpAndSettle();
    expect(find.text('Envoyer le code'), findsOneWidget);

    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();
    expect(find.text('Bon retour'), findsOneWidget);
  });

  testWidgets('La Vérification mène à la Connexion', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Commencer mes achats'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Suivant'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mot de passe oublié ?'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Envoyer le code'));
    await tester.pumpAndSettle();
    expect(find.text('Vérification'), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, '4');
    await tester.pump();
    expect(find.text('4'), findsOneWidget);

    await tester.tap(find.text('Réinitialiser le mot de passe'));
    await tester.pumpAndSettle();
    expect(find.text('Bon retour'), findsOneWidget);
  });

  testWidgets("Se connecter ouvre l'Accueil", (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Commencer mes achats'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Suivant'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    expect(find.text('Bonjour, Rayen'), findsOneWidget);
    expect(find.text('Populaires'), findsOneWidget);
    expect(find.text('Accueil'), findsOneWidget);
  });

  testWidgets("S'inscrire ouvre l'Accueil", (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Commencer mes achats'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Suivant'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Créer un compte'));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text("S'inscrire"));
    await tester.pumpAndSettle();
    await tester.tap(find.text("S'inscrire"));
    await tester.pumpAndSettle();

    expect(find.text('Bonjour, Rayen'), findsOneWidget);
  });

  testWidgets('La cloche ouvre les Notifications et Tout lire marche',
      (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Commencer mes achats'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Suivant'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.notifications_none));
    await tester.pumpAndSettle();
    expect(find.text('Commande expédiée'), findsOneWidget);

    final unreadDot = find.byWidgetPredicate((widget) {
      if (widget is! Container || widget.decoration is! BoxDecoration) {
        return false;
      }
      final decoration = widget.decoration as BoxDecoration;
      return decoration.shape == BoxShape.circle &&
          decoration.color == AppColors.green;
    });
    expect(unreadDot, findsNWidgets(2));

    await tester.tap(find.text('Tout lire'));
    await tester.pump();
    expect(unreadDot, findsNothing);

    await tester.tap(find.byIcon(Icons.chevron_left));
    await tester.pumpAndSettle();
    expect(find.text('Bonjour, Rayen'), findsOneWidget);
  });
}
