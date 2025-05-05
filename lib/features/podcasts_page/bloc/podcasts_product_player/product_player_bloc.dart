import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:otherstory_app/features/podcasts_page/data/models/podcasts_product_model.dart';

part 'product_player_event.dart';
part 'product_player_state.dart';

class ProductPlayerBloc extends Bloc<ProductPlayerEvent, ProductPlayerState> {
  ProductPlayerBloc() : super(ProductPlayerInitial()) {
    on<LoadProductPlayer>((event, emit) {
      emit(ProductPlayerLoading());

      try {
        final List<PodcastsProductModel> productsList = [
          PodcastsProductModel(
            id: 1,
            time: '< 1 часа',
            title: 'Детская позиция',
            subtitle: 'Не очень длинное но интригующее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(hours: 5, minutes: 34, seconds: 30),
          ),
          PodcastsProductModel(
            id: 2,
            time: '2 часа',
            title: 'Как медитировать?',
            subtitle: 'Успокаивающая практика для снятия стресса',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
          PodcastsProductModel(
            id: 3,
            time: '2 часа',
            title: 'Медитация похудения',
            subtitle: 'Не очень длинное но интригуещее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
          PodcastsProductModel(
            id: 4,
            time: '1 час',
            title: 'Денежные блоки',
            subtitle: 'Полное расслабление тела и ума',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: false,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
          PodcastsProductModel(
            id: 3,
            time: '2 часа',
            title: 'Медитация похудения',
            subtitle: 'Не очень длинное но интригуещее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: false,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
          PodcastsProductModel(
            id: 3,
            time: '2 часа',
            title: 'Медитация похудения',
            subtitle: 'Не очень длинное но интригуещее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: false,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
        ];
        emit(ProductPlayerLoaded(productsList: productsList));
      } catch (e) {
        emit(ProductPlayerFailure(textError: 'Что-то пошло не так'));
      }
    });
  }
}
