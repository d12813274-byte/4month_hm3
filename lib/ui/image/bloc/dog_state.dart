sealed class DogState {}
class DogInitial extends DogState {}
class DogLoading extends DogState{}


class DogLoaded extends DogState {
  final String imageUrl;
  DogLoaded(this.imageUrl);
}

class DogError extends DogState {

}