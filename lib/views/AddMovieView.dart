// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:projet/globals/MovieList.dart';
import 'package:projet/models/Movie.dart';
import 'package:projet/views/HomePageView.dart';

class AddMovieView extends StatefulWidget {
  final Movie?
      movie; // Accepter un film existant ou null pour ajouter un nouveau film.

  const AddMovieView({super.key, this.movie});

  @override
  State<AddMovieView> createState() => _AddMovieViewState();
}

class _AddMovieViewState extends State<AddMovieView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController pictureController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  late String pageTitle = 'Ajouter un film';

  @override
  void initState() {
    super.initState();
    if (widget.movie != null) {
      // Si un film doit être modifié, rempli les contrôleurs avec ses valeurs.
      titleController.text = widget.movie!.title;
      pageTitle = 'Modifier film';
      //pictureController.text = widget.movies!.picture;
      //dateController.text = widget.movies!.releaseDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(pageTitle),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Titre du film',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Entrez le titre du film';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: pictureController,
            decoration: InputDecoration(
              labelText: 'Adresse de l\'image du film',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Entrez l\'adresse de l\'image du film';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: dateController,
            decoration: InputDecoration(
              labelText: 'Date de sortie du film',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Entrez la date de sortie du film';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              final title = titleController.text;
              final picture = pictureController.text;
              final date = dateController.text;

              final newMovie =
                  Movie(title: title, picture: picture, releaseDate: date);

              movies.add(newMovie);

              // Effacer les contrôleurs après la soumission.
              titleController.clear();
              pictureController.clear();
              dateController.clear();

              Navigator.pop(context);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
