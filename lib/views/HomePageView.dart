// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:projet/globals/movieList.dart';
import 'package:projet/globals/navigateTo.dart';
import 'package:projet/models/Movie.dart';
import 'package:projet/views/MovieView.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading:
            false, //supprimer la fleche de retour de l'AppBar
        centerTitle: true,
        title: const Text(
          'Liste des films',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: movies.length,
            itemBuilder: ((context, index) {
              Movie movie = movies[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: Text(movie.title),
                  subtitle: Text(movie.releaseDate),
                  leading: Text(movie.picture),
                  trailing: SizedBox(
                    width: 97,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieView(
                                    movieToUpdate: movie,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.green,
                            )),
                        IconButton(
                          onPressed: () {
                            movies.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                onPressed: () {
                  navigateTo(MovieView(), context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(15),
                color: Colors.pink,
                child: const Text(
                  'Ajouter un film',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
