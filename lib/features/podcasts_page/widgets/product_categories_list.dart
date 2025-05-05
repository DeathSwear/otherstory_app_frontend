import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otherstory_app/features/podcasts_page/bloc/podcasts_categories_list/categories_list_bloc.dart';
import 'package:otherstory_app/theme/app_colors.dart';
import 'package:otherstory_app/theme/app_text_styles.dart';

class ProductCategoriesList extends StatelessWidget {
  const ProductCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: BlocBuilder<CategoriesListBloc, CategoriesListState>(
          builder: (context, state) {
            if (state is CategoriesListLoaded) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: state.categoriesList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<CategoriesListBloc>()
                          .add(SelectCategory(selectedIndex: index));
                    },
                    child: Container(
                      height: 28,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                          color: state.selectedIndex == index
                              ? AppColors.blackColor
                              : AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Text(state.categoriesList[index].categoriesName,
                          style: state.selectedIndex == index
                              ? AppTextStyles.activeCategoriesTextStyle
                              : AppTextStyles.unActiveCategoriesTextStyle),
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
