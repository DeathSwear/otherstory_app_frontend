import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:otherstory_app/features/meditations_page/data/models/meditations_category_model.dart';

part 'categories_list_event.dart';
part 'categories_list_state.dart';

class CategoriesListBloc
    extends Bloc<CategoriesListEvent, CategoriesListState> {
  CategoriesListBloc() : super(CategoriesListInitial()) {
    on<LoadCategoriesList>((event, emit) {
      emit(CategoriesListLoading());
      try {
        final List<MeditationsCategoryModel> categoriesList = [
          MeditationsCategoryModel(0, categoriesName: 'Все медитации'),
          MeditationsCategoryModel(1, categoriesName: 'Успокаивающие'),
          MeditationsCategoryModel(2, categoriesName: 'Энергичные'),
          MeditationsCategoryModel(3, categoriesName: 'Успокаивающие'),
          MeditationsCategoryModel(4, categoriesName: 'Энергичные'),
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
