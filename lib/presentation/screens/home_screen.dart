import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hetro_anime/presentation/widgets/shared/list_category/list_category.dart';
import 'package:hetro_anime/presentation/widgets/shared/search_widget.dart';
import 'package:hetro_anime/presentation/widgets/shared/top_anime_screen/top_anime.dart';
import 'package:hetro_anime/presentation/widgets/text_theme/text_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: BodyLargTheme(text: "What do you want to watch?")),
      body: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            SearchWidget(),
            TopAnime(),
            ListCategory(),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
