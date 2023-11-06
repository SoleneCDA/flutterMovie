// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:projet/globals/MovieList.dart';
import 'package:projet/views/AddMovieView.dart';
import 'package:projet/views/MovieDetailPage.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key, required this.title});
  final String title;

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        //liste des films contenus dans la liste movies
        padding: const EdgeInsets.all(8),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                // permet d'appuyer sur le titre du film pour voir le détail
                context,
                MaterialPageRoute(
                  // renvoi à la page MovieDetailPage
                  builder: (context) => MovieDetailPage(
                    movies: movie,
                  ),
                ),
              );
            },
            shape: OutlineInputBorder(
              // bordure pour chaque film + radius
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(movie.title), // ne montre que le titre du film
          );
        },
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: FloatingActionButton(
          // bouton pour pouvoir ajouter un film dans la liste movies
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const AddMovieView(), // renvoi à la page AddMovieView
              ),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ajouter un nouveau film'), // Titre du bouton
              Icon(
                Icons.arrow_forward, // Icône fleche droite
              ),
            ],
          ),
        ),
      ),
    );
  }
}
