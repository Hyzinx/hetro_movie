import 'package:flutter/material.dart';
import 'package:hetro_anime/consts/my_colors.dart';

class BottomMenueMovie extends StatefulWidget {
  const BottomMenueMovie({
    super.key,
    required this.selectedIndex,
    required this.onSelectedButton,
  });
  final int selectedIndex;
  final void Function(int) onSelectedButton;

  @override
  State<BottomMenueMovie> createState() => _BottomMenueMovieState();
}

class _BottomMenueMovieState extends State<BottomMenueMovie> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: BoxBorder.fromSTEB(
          top: BorderSide(color: MyColors.mainBorderColore, width: 2),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        child: BottomNavigationBar(
          backgroundColor: MyColors.mainColore,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              widget.onSelectedButton(index);
              _selectedIndex = index;
            });
          },
          iconSize: 30,
          unselectedItemColor: MyColors.secondaryBorderColore,
          elevation: 0,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              backgroundColor: MyColors.mainBorderColore,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: MyColors.mainBorderColore,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline_sharp),
              label: 'Watch list',
              backgroundColor: MyColors.mainBorderColore,
            ),
          ],
        ),
      ),
    );
  }
}
