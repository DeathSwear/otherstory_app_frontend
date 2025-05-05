part of 'categories_list_bloc.dart';

@immutable
sealed class CategoriesListState {}

final class CategoriesListInitial extends CategoriesListState {}

final class CategoriesListLoading extends CategoriesListState {}

final class CategoriesListLoaded extends CategoriesListState {
  final List<PodcastsCategoryModel> categoriesList;
  final int selectedIndex;

  CategoriesListLoaded(
      {required this.categoriesList, required this.selectedIndex});
}

final class CategoriesListFailure extends CategoriesListState {
  final String textError;

  CategoriesListFailure({required this.textError});
}
