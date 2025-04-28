import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:otherstory_app/features/meditations_page/data/models/meditations_product_model.dart';

part 'product_player_event.dart';
part 'product_player_state.dart';

class ProductPlayerBloc extends Bloc<ProductPlayerEvent, ProductPlayerState> {
  ProductPlayerBloc() : super(ProductPlayerInitial()) {
    on<LoadProductPlayer>((event, emit) {
      emit(ProductPlayerLoading());

      try {
        final List<MeditationsProductModel> productsList = [
          MeditationsProductModel(
            id: 1,
            time: '5 часов 34 минуты 30 секунд',
            title: 'Денежная медитация от стресса и беспокойного мозга',
            subtitle: 'Не очень длинное но интригующее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(hours: 5, minutes: 34, seconds: 30),
          ),
          MeditationsProductModel(
            id: 2,
            time: '15 минут 12 секунд',
            title: 'Антистресс медитация',
            subtitle: 'Успокаивающая практика для снятия стресса',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
          MeditationsProductModel(
            id: 3,
            time: '2 часа',
            title: 'Медитация похудения',
            subtitle: 'Не очень длинное но интригуещее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
               duration: const Duration(minutes: 15, seconds: 12),
          ),
          MeditationsProductModel(
            id: 4,
            time: '3 часа',
            title: 'Для лучшего настроения',
            subtitle: 'Полное расслабление тела и ума',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: false,
               duration: const Duration(minutes: 15, seconds: 12),
          ),
          MeditationsProductModel(
            id: 5,
            time: '7 минут',
            title: 'Перезагрузка сознания',
            subtitle: 'Быстрая практика для обнуления мыслей',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: false,
               duration: const Duration(minutes: 15, seconds: 12),
          ),
          MeditationsProductModel(
            id: 6,
            time: '10 минут',
            title: 'Медитация благодарности',
            subtitle: 'Развитие благодарности и положительного мышления',
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
