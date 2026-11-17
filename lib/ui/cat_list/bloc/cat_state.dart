part of 'cat_bloc.dart';


@immutable
sealed class CatState {}

final class CatInitial extends CatState {}

final class LoadingCatState extends CatState {}
final class LoadedCatState extends CatState {
   LoadedCatState({required this.list});

   final List<CatModel> list;
}

final class ErrorCatState extends CatState {
}