// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:projet/globals/movieList.dart';
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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool firstTime = true;
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
        foregroundColor: Colors
            .white, // -> permet de mettre la fleche de retour (et le texte) en blanc
        //automaticallyImplyLeading: false,      -> supprime la fleche de retour
        centerTitle: true,
        title: Text(
          pageTitle,
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
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: IconButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    firstTime = false;
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      Movie newMovie = Movie(
                        title: titleController.text,
                        picture: pictureController.text,
                        releaseDate: dateController.text,
                      );
                      movies.add(newMovie);
                      print(movies.length);
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePageView(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
