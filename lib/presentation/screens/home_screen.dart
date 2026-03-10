import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hetro_anime/business/cubit/movie_cubit.dart';
import 'package:hetro_anime/business/states/movie_state.dart';
import 'package:hetro_anime/consts/my_colors.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/presentation/model/category.dart';
import 'package:hetro_anime/presentation/screens/main_screen.dart';
import 'package:hetro_anime/presentation/screens/search_screen.dart';
import 'package:hetro_anime/presentation/screens/watch_list_screen.dart';
import 'package:hetro_anime/presentation/widgets/shared/bottom_navigation_bar/bottom_menue_movie.dart';
import 'package:hetro_anime/presentation/widgets/shared/list_category/list_category.dart';
import 'package:hetro_anime/presentation/widgets/shared/list_movies/movie_list_view.dart';
import 'package:hetro_anime/presentation/widgets/shared/top_movie_screen/top_movie.dart';
import 'package:hetro_anime/presentation/widgets/text_theme/text_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedButtonIndex = 0;
  final List<Widget> screens = [
    MainScreen(),
    SearchScreen(),
    WatchListScreen(),
  ];

  void onSelectedButton(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenueMovie(
        selectedIndex: selectedButtonIndex,
        onSelectedButton: onSelectedButton,
      ),
      appBar: AppBar(title: BodyLargTheme(text: "Hetro Movie")),
      body: screens[selectedButtonIndex],
    );
  }
}
