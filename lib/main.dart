import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapplication/Home/WebView.dart';
import 'package:newsapplication/Home/home%20page.dart';
import 'package:newsapplication/Home/my_theme.dart';
import 'package:newsapplication/News/NewsDetalisScreen.dart';
import 'package:newsapplication/provider/app_config_provider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => appconfigprocider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appconfigprocider>(context);
    return MaterialApp(
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        NewsDetailsScreen.route:(context)=>NewsDetailsScreen(),
        Webview.route:(context)=>Webview(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),

    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: MyTheme.lighttheme,
    locale: Locale(provider.applang),
    );
  }
}


