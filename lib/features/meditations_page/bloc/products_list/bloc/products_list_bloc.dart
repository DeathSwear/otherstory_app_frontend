import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:otherstory_app/features/meditations_page/data/models/meditations_product_model.dart';
part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc() : super(ProductsListInitial()) {
    on<LoadProductsList>((event, emit) {
      emit(ProductsListLoading());
      try {
        final List<MeditationsProductModel> productsList = [
          MeditationsProductModel(
            id: 1,
            time: '5 часов',
            title: 'Денежная медитация от стресса и беспокойного мозга',
            subtitle: 'Не очень длинное но интригуещее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
          ),
          MeditationsProductModel(
            id: 2,
            time: '15 минут',
            title: 'Антистресс медитация',
            subtitle: 'Успокаивающая практика для снятия стресса',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
          ),
          MeditationsProductModel(
            id: 3,
            time: '2 часа',
            title: 'Медитация похудения',
            subtitle: 'Не очень длинное но интригуещее описание на две строчки',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: true,
          ),
          MeditationsProductModel(
            id: 4,
            time: '3 часа',
            title: 'Для лучшего настроения',
            subtitle: 'Полное расслабление тела и ума',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: false,
          ),
          MeditationsProductModel(
            id: 5,
            time: '7 минут',
            title: 'Перезагрузка сознания',
            subtitle: 'Быстрая практика для обнуления мыслей',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: false,
          ),
          MeditationsProductModel(
            id: 6,
            time: '10 минут',
            title: 'Медитация благодарности',
            subtitle: 'Развитие благодарности и положительного мышления',
            imageSource:
                'https://pic.rutubelist.ru/user/b5/e4/b5e47a7c6b9b9945e1971888da0fae13.jpg',
            isFree: false,
          ),
        ];
        // Сортируем продукты: сначала бесплатные, затем платные
        productsList.sort((a, b) {
          if (a.isFree == b.isFree) return 0;
          return a.isFree ? -1 : 1;
        });

        emit(ProductsListLoaded(producstList: productsList));
      } catch (e) {
        emit(ProductsListFailure(textError: 'Произошла ошибка'));
      }
    });
  }
}
