// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:projet/globals/MovieList.dart';
import 'package:projet/models/Movie.dart';
import 'package:projet/views/AddMovieView.dart';
import 'package:projet/views/HomePageView.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({
    super.key,
    required this.movie,
  });

  void deleteMovie(BuildContext context) {
    // Supprimer le film
    movies.removeWhere((element) => element == movie);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        // renvoi à la page HomePageView
        builder: (context) => const HomePageView(),
      ),
    );
  }

  void editMovie(BuildContext context) {
    // Modifier le film
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const AddMovieView(), // renvoi à la page AddMovieView
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Détails du Film'),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                //  Image.network(
                //   movie.picture), // Affichez l'image du film depuis l'URL.
                const SizedBox(height: 16.0),
                Text('Titre du film : ${movie.title}'),
                //Text('Date de sortie : ${movie.releaseDate.toString()}'),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  deleteMovie(context); //Supprimer le film
                },
                color: Colors.red, // Couleur du bouton rouge.
                icon: const Icon(Icons.delete), // Icône de poubelle.
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: IconButton(
                onPressed: () {
                  editMovie(context); // Modifier le film.
                },
                color: Colors.green, // Couleur du bouton vert
                icon: const Icon(Icons.edit), // Icône crayon
              ),
            ),
          ],
        ),
      ),
    );
  }
}
