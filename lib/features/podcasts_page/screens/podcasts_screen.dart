import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otherstory_app/features/global/widgets/product_app_bar.dart';
import 'package:otherstory_app/features/global/widgets/product_card.dart';
import 'package:otherstory_app/features/podcasts_page/bloc/podcasts_categories_list/categories_list_bloc.dart';
import 'package:otherstory_app/features/podcasts_page/bloc/podcasts_products_list/products_list_bloc.dart';
import 'package:otherstory_app/features/podcasts_page/widgets/product_categories_list%20copy.dart';

class PodcastsScreen extends StatefulWidget {
  const PodcastsScreen({super.key});

  @override
  State<PodcastsScreen> createState() => _PodcastsScreenState();
}

class _PodcastsScreenState extends State<PodcastsScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesListBloc()..add(LoadCategoriesList()),
        ),
        BlocProvider(
            create: (context) => ProductsListBloc()..add(LoadProductsList()))
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const ProductAppBar(
            icon: Icons.error_outline,
            title: 'Аудио подкасты',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 7, bottom: 13),
                child: ProductCategoriesList(),
              ),
              BlocBuilder<ProductsListBloc, ProductsListState>(
                builder: (context, state) {
                  if (state is ProductsListLoaded) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.productsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          child: GestureDetector(
                            onTap: () {
                              final selectedProduct = state.productsList[index];

                              if (selectedProduct.isFree) {
                                context.push(
                                  '/podcasts_player',
                                  extra: selectedProduct,
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Подкаст недоступен'),
                                    content: const Text(
                                        'Этот подкаст доступен только по подписке.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Ок'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ProductCard(
                                      data: state.productsList[index],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (state is ProductsListFailure) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Что-то пошло не так'),
                        TextButton(
                          onPressed: () {
                            context
                                .read<ProductsListBloc>()
                                .add(LoadProductsList());
                          },
                          child: const Text('попробовать еще раз'),
                        )
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
