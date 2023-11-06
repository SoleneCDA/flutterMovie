// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:projet/models/Movie.dart';
import 'package:projet/views/AddMovieView.dart';
import 'package:projet/views/HomePageView.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movies;

  const MovieDetailPage({
    super.key,
    required this.movies,
  });

  void deleteMovie(BuildContext context) {
    // Supprimer le film
    //movies.remove(movies);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        // renvoi à la page HomePageView
        builder: (context) => const HomePageView(title: 'Liste des films'),
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
        child: Column(
          children: [
            //  Image.network(
            //   movie.picture), // Affichez l'image du film depuis l'URL.
            const SizedBox(height: 16.0),
            Text('Titre du film : ${movies.title}'),
            //Text('Date de sortie : ${movie.releaseDate.toString()}'),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              deleteMovie(context); //Supprimer le film
            },
            backgroundColor: Colors.red, // Couleur du bouton rouge.
            child: const Icon(Icons.delete), // Icône de poubelle.
          ),
          FloatingActionButton(
            onPressed: () {
              editMovie(context); // Modifier le film.
            },
            backgroundColor: Colors.green, // Couleur du bouton vert
            child: const Icon(Icons.edit), // Icône crayon
          ),
        ],
      ),
    );
  }
}
