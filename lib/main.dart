import 'package:app_alpop/core/help/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const abooteeg());
}
class abooteeg extends StatelessWidget {
  const abooteeg({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AcssesRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 10, 39, 206),
      ),
    );
  }
}
