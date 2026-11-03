import 'package:flutter_test/flutter_test.dart';

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
}
