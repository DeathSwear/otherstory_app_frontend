part of 'categories_list_bloc.dart';

@immutable
sealed class CategoriesListEvent {}

class LoadCategoriesList extends CategoriesListEvent {}

class SelectCategory extends CategoriesListEvent {
  final int selectedIndex;

  SelectCategory({required this.selectedIndex});
}
