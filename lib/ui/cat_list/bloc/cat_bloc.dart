import 'package:bloc/bloc.dart';
import 'package:flutter_hm2/data/repository/animal_repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_hm2/data/models/cat_model.dart';
part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc  extends Bloc<CatEvent, CatState>{
  final AnimalRepository _animalRepository = AnimalRepository();
  CatBloc() : super(CatInitial()) {
    on<LoadCatImagesEvent>((event, emit) async{
      emit(LoadingCatState());
      try{
      final List<CatModel> CatList = await _animalRepository.getCats();
      emit(LoadedCatState(list: CatList));
      }catch(error){
        emit(ErrorCatState());
      }
    });
  }
}