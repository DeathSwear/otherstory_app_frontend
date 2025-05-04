import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otherstory_app/features/meditations_page/bloc/categories_list/categories_list_bloc.dart';
import 'package:otherstory_app/features/meditations_page/bloc/products_list/bloc/products_list_bloc.dart';
import 'package:otherstory_app/features/meditations_page/presentation/widgets/categories_list.dart';
import 'package:otherstory_app/features/meditations_page/presentation/widgets/product_app_bar.dart';
import 'package:otherstory_app/features/meditations_page/presentation/widgets/product_card.dart';

class MeditationsScreen extends StatefulWidget {
  const MeditationsScreen({super.key});

  @override
  State<MeditationsScreen> createState() => _MeditationsScreenState();
}

class _MeditationsScreenState extends State<MeditationsScreen> {
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
          title: const MeditationAppBar(
            icon: Icons.error_outline,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 7, bottom: 13),
                child: CategoriesList(),
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
                                  '/meditations_player',
                                  extra: selectedProduct,
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Медитация недоступна'),
                                    content: const Text(
                                        'Эта медитация доступна только по подписке.'),
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
                                      products: state.productsList[index],
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
