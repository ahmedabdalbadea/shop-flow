import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_flow/core/utlis/app_router.dart';
import 'package:shop_flow/generated/l10n.dart';

void main() {
  runApp(const ShopFlow());
}

class ShopFlow extends StatelessWidget {
  const ShopFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
