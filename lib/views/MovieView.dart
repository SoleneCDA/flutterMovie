// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projet/globals/movieList.dart';
import 'package:projet/globals/navigateTo.dart';
import 'package:projet/models/Movie.dart';
import 'package:projet/views/HomePageView.dart';

class MovieView extends StatefulWidget {
  Movie? movieToUpdate;

  MovieView({super.key, this.movieToUpdate});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  late Movie? movieToUpdate = widget.movieToUpdate;

  late TextEditingController titleController = TextEditingController(
      text: movieToUpdate != null ? movieToUpdate?.title : '');
  late TextEditingController pictureController = TextEditingController(
      text: movieToUpdate != null ? movieToUpdate?.picture : '');
  late TextEditingController releaseDateController = TextEditingController(
      text: movieToUpdate != null ? movieToUpdate?.releaseDate : '');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String viewTitle =
      movieToUpdate != null ? 'Modifier le film' : 'Ajouter un film';
  bool firstTime = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Colors
            .white, // -> permet de mettre la fleche de retour (et le texte) en blanc
        //automaticallyImplyLeading: false,      -> supprime la fleche de retour
        centerTitle: true,
        title: Text(
          viewTitle,
          //style: const TextStyle(color: Colors.white),   -> pas besoin si on met un foregroundColor
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          autovalidateMode:
              firstTime // vérification: pas de verification cas par cas avant le clic sur le bouton.
                  //Si erreur de remplissage: verification direct, caractére par caractere, au fur et à mesure que l'utilisateur tape du texte
                  ? AutovalidateMode.disabled
                  : AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                //autofocus: true,     -> met le curseur sur ce champs direct
                textCapitalization: TextCapitalization.characters,
                // keyboardType: TextInputType.number,    -> clavier juste avec des nombres
                decoration: InputDecoration(
                  labelText: 'Titre du film',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    // if (value == null || value == '')
                    return 'Entrez le titre du film';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: releaseDateController,
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
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MaterialButton(
                  onPressed: () {
                    firstTime = false;
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      if (movieToUpdate != null) {
                        movieToUpdate!.title = titleController.text;
                        movieToUpdate!.picture = pictureController.text;
                        movieToUpdate!.releaseDate = releaseDateController.text;
                      } else {
                        Movie newMovie = Movie(
                          title: titleController.text,
                          picture: pictureController.text,
                          releaseDate: releaseDateController.text,
                        );
                        movies.add(newMovie);
                      }

                      navigateTo(const HomePageView(), context);
                    }
                  },
                  color: Colors.pink,
                  child: Text(
                    movieToUpdate != null
                        ? "modifier le film"
                        : "Ajouter un film",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
