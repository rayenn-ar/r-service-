import 'package:flutter_test/flutter_test.dart';

import 'package:r_serrvice/main.dart';

void main() {
  testWidgets('La page Splash s\'affiche', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('R-service'), findsOneWidget);
    expect(find.text('Commencer mes achats'), findsOneWidget);
    expect(find.text('Version 1.0'), findsOneWidget);
  });
}
