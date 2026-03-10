import 'package:flutter/material.dart';
import 'package:hetro_anime/data/models/review.dart';
import 'package:hetro_anime/presentation/widgets/shared/reiview/review_card.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key, required this.reviews});
  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviews.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => ReviewCard(reviews: reviews[index]),
    );
  }
}
