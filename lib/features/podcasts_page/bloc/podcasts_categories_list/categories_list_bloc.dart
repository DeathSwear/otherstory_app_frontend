import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:otherstory_app/features/podcasts_page/data/models/podcasts_category_model.dart';

part 'categories_list_event.dart';
part 'categories_list_state.dart';

class CategoriesListBloc
    extends Bloc<CategoriesListEvent, CategoriesListState> {
  CategoriesListBloc() : super(CategoriesListInitial()) {
    on<LoadCategoriesList>((event, emit) {
      emit(CategoriesListLoading());
      try {
        final List<PodcastsCategoryModel> categoriesList = [
          PodcastsCategoryModel(0, categoriesName: 'Все подкасты'),
          PodcastsCategoryModel(1, categoriesName: 'Про деньги'),
          PodcastsCategoryModel(2, categoriesName: 'Семья'),
          PodcastsCategoryModel(3, categoriesName: 'Потребности'),
          PodcastsCategoryModel(4, categoriesName: 'Энергичные'),
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
