part of 'products_list_bloc.dart';

@immutable
sealed class ProductsListEvent {}

class LoadProductsList extends ProductsListEvent {}
