part of 'products_list_bloc.dart';

@immutable
sealed class ProductsListState {}

final class ProductsListInitial extends ProductsListState {}

class ProductsListLoading extends ProductsListState {}

class ProductsListLoaded extends ProductsListState {
  final List<MeditationsProductModel> productsList;

  ProductsListLoaded({required this.productsList});
}

class ProductsListFailure extends ProductsListState {
  final String textError;

  ProductsListFailure({required this.textError});
}
