import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otherstory_app/features/navigation/presentation/widgets/app_router.dart';

void main() {
  runZonedGuarded(() => runApp(const MainApp()), (error, stack) {
    log(error.toString(), name: 'App Error', stackTrace: stack);
  });
}

final GoRouter _router = AppRouter.router;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
