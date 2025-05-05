import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:otherstory_app/features/music_page/data/models/music_product_model.dart';

part 'product_player_event.dart';
part 'product_player_state.dart';

class ProductPlayerBloc extends Bloc<ProductPlayerEvent, ProductPlayerState> {
  ProductPlayerBloc() : super(ProductPlayerInitial()) {
    on<LoadProductPlayer>((event, emit) {
      emit(ProductPlayerLoading());

      try {
        final List<MusicProductModel> productsList = [
          MusicProductModel(
            id: 1,
            time: '15 минут',
            title: 'Глухой лес',
            subtitle: 'Не очень длинное но интригующее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(hours: 5, minutes: 34, seconds: 30),
          ),
          MusicProductModel(
            id: 2,
            time: '21 минута',
            title: 'Звонкие склоны',
            subtitle: 'Успокаивающая практика для снятия стресса',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
          MusicProductModel(
            id: 3,
            time: '12 минут',
            title: 'Шумный берег',
            subtitle: 'Не очень длинное но интригуещее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
          MusicProductModel(
            id: 2,
            time: '21 минута',
            title: 'Звонкие склоны',
            subtitle: 'Успокаивающая практика для снятия стресса',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
          MusicProductModel(
            id: 2,
            time: '21 минута',
            title: 'Звонкие склоны',
            subtitle: 'Успокаивающая практика для снятия стресса',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: false,
            duration: const Duration(minutes: 15, seconds: 12),
          ),
          MusicProductModel(
            id: 2,
            time: '21 минута',
            title: 'Звонкие склоны',
            subtitle: 'Успокаивающая практика для снятия стресса',
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
