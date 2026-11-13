import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hm2/data/repository/animal_repository.dart';
import 'package:flutter_hm2/ui/image/bloc/dog_bloc.dart';
import 'package:flutter_hm2/ui/my_dog_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => DogBloc(AnimalRepository()),
        child: const MyDogPage(),
      ),
    );
  }
}