part of 'product_player_bloc.dart';

@immutable
sealed class ProductPlayerState {}

final class ProductPlayerInitial extends ProductPlayerState {}

class ProductPlayerLoading extends ProductPlayerState {}

class ProductPlayerLoaded extends ProductPlayerState {
  final List<PodcastsProductModel> productsList;

  ProductPlayerLoaded({required this.productsList});
}

class ProductPlayerFailure extends ProductPlayerState {
  final String textError;

  ProductPlayerFailure({required this.textError});
}
