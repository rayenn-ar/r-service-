import 'package:flutter_test/flutter_test.dart';

import 'package:r_serrvice/app.dart';
import 'package:r_serrvice/core/constants/app_strings.dart';

void main() {
  testWidgets("L'application démarre sur le splash", (tester) async {
    await tester.pumpWidget(const RServiceApp());
    await tester.pumpAndSettle();

    expect(find.text(AppStrings.appName), findsOneWidget);
    expect(find.text(SplashStrings.tagline), findsOneWidget);
    expect(find.text(SplashStrings.fastDelivery), findsOneWidget);
    expect(find.text(SplashStrings.securePayment), findsOneWidget);
    expect(find.text(SplashStrings.startShopping), findsOneWidget);
    expect(find.text(AppStrings.appVersion), findsOneWidget);
  });
}
