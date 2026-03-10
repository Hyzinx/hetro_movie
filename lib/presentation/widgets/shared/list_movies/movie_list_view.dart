import 'package:flutter/material.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/presentation/widgets/shared/list_movies/movie_card.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({
    super.key,
    required this.onTapOnMovie,
    required this.selectedList,
  });
  final List<Movie> selectedList;

  final void Function(int) onTapOnMovie;

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
      itemCount: widget.selectedList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => widget.onTapOnMovie(widget.selectedList[index].id as int),
        child: MovieCard(image: widget.selectedList[index].posterPath),
      ),
    );
  }
}
