import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:flutter_hm2/data/repository/animal_repository.dart';
import 'package:flutter_hm2/ui/cat_list/bloc/my_cats_page.dart';
import 'package:flutter_hm2/ui/image/bloc/dog_bloc.dart';
import 'package:flutter_hm2/ui/my_dog_page.dart';

void main() {
  Bloc.observer = TalkerBlocObserver();
  runApp(MaterialApp(home:  MyCatsPage()));
}