import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:otherstory_app/features/music_page/data/models/music_category_model.dart';

part 'categories_list_event.dart';
part 'categories_list_state.dart';

class CategoriesListBloc
    extends Bloc<CategoriesListEvent, CategoriesListState> {
  CategoriesListBloc() : super(CategoriesListInitial()) {
    on<LoadCategoriesList>((event, emit) {
      emit(CategoriesListLoading());
      try {
        final List<MusicCategoryModel> categoriesList = [
          MusicCategoryModel(0, categoriesName: 'Вся музыка'),
          MusicCategoryModel(1, categoriesName: 'Утренняя'),
          MusicCategoryModel(2, categoriesName: 'Под кофе'),
          MusicCategoryModel(3, categoriesName: 'Хочется переслушивать'),
          MusicCategoryModel(4, categoriesName: 'Энергичные'),
        ];
        emit(CategoriesListLoaded(
            categoriesList: categoriesList, selectedIndex: 0));
      } catch (e) {
        emit(CategoriesListFailure(textError: 'Произошла ошибка'));
      }
    });

    on<SelectCategory>((event, emit) {
      if (state is CategoriesListLoaded) {
        final currentState = state as CategoriesListLoaded;
        emit(
          CategoriesListLoaded(
            categoriesList: currentState.categoriesList,
            selectedIndex: event.selectedIndex,
          ),
        );
      }
    });
  }
}
