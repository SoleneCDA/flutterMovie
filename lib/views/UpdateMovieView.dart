import 'package:flutter/material.dart';
import 'package:projet/models/Movie.dart';

class UpdateMovieView extends StatefulWidget {
  Movie movieToUpdate;
  UpdateMovieView({
    super.key,
    required this.movieToUpdate,
  });

  @override
  State<UpdateMovieView> createState() => _UpdateMovieViewState();
}

class _UpdateMovieViewState extends State<UpdateMovieView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
