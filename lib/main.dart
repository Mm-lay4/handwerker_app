import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handwerker_app/routes/app_routes.dart';
import 'package:handwerker_app/view/login_screen/login_view.dart';
import 'package:handwerker_app/view/navigation_view/nav_layer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

bool? isDark;

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      themeMode: isDark == null
          ? ThemeMode.system
          : isDark!
              ? ThemeMode.dark
              : ThemeMode.light,

      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      // theme: ThemeData().copyWith(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
