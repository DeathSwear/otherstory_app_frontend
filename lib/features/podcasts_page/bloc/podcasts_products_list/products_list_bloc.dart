import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:otherstory_app/features/podcasts_page/data/models/podcasts_product_model.dart';
part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc() : super(ProductsListInitial()) {
    on<LoadProductsList>((event, emit) {
      emit(ProductsListLoading());
      try {
        final List<PodcastsProductModel> productsList = [
          PodcastsProductModel(
            id: 1,
            time: '< 1 часа',
            title: 'Детская позиция',
            subtitle: 'Не очень длинное но интригуещее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(hours: 5, minutes: 25, seconds: 12),
          ),
          PodcastsProductModel(
            id: 2,
            time: '2 часа',
            title: 'Как медитировать?',
            subtitle: 'Успокаивающая практика для снятия стресса',
            imageSource:
                'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg',
            isFree: true,
            duration: const Duration(hours: 2, minutes: 2, seconds: 14),
          ),
          PodcastsProductModel(
            id: 3,
            time: '1 час',
            title: 'Денежные блоки',
            subtitle: 'Не очень длинное но интригуещее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(hours: 3, minutes: 30, seconds: 30),
          ),
          PodcastsProductModel(
            id: 2,
            time: '2 часа',
            title: 'Как медитировать?',
            subtitle: 'Успокаивающая практика для снятия стресса',
            imageSource:
                'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg',
            isFree: false,
            duration: const Duration(hours: 2, minutes: 2, seconds: 14),
          ),
          PodcastsProductModel(
            id: 2,
            time: '2 часа',
            title: 'Как медитировать?',
            subtitle: 'Успокаивающая практика для снятия стресса',
            imageSource:
                'https://a.d-cd.net/XmtPdFb25hEB7iT9G2Qul-LzHz8-1920.jpg',
            isFree: false,
            duration: const Duration(hours: 2, minutes: 2, seconds: 14),
          ),
        ];
        // Сортируем продукты: сначала бесплатные, затем платные
        productsList.sort((a, b) {
          if (a.isFree == b.isFree) return 0;
          return a.isFree ? -1 : 1;
        });

        emit(ProductsListLoaded(productsList: productsList));
      } catch (e) {
        emit(ProductsListFailure(textError: 'Произошла ошибка'));
      }
    });
  }
}
