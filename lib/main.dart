import 'package:flutter/material.dart';
import 'package:hetro_anime/injection.dart';
import 'package:hetro_anime/presentation/routes/app_router.dart';
import 'package:hetro_anime/presentation/themes/main_theme.dart';

void main() {
  initializeDependency();
  runApp(HetroAnime(appRouter: AppRouter()));
}

class HetroAnime extends StatelessWidget {
  const HetroAnime({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
