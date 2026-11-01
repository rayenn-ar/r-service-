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
}
