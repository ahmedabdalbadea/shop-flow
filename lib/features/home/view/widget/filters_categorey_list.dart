import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/features/home/manager/category_list_cubit/category_list_cubit.dart';
import 'package:shop_flow/features/home/manager/search_products_cubit/search_products_cubit.dart';
import 'package:shop_flow/core/widget/filter_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FiltersCategoreyList extends StatelessWidget {
  const FiltersCategoreyList({super.key, this.fromHome = false});
  final bool fromHome;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListCubit, CategoryListState>(
      builder: (context, state) {
        if (state is CategoryListSuccess) {
          final List<dynamic> filtersList = context
              .read<CategoryListCubit>()
              .categoreyList!;

          return SizedBox(
            height: 33,
            child: SuccessFiltersBody(
              fromHome: fromHome,
              filtersList: filtersList,
            ),
          );
        } else if (state is CategoryListFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return Skeletonizer(
            child: SuccessFiltersBody(
              fromHome: fromHome,
              filtersList: List.generate(6, (index) => "hello world"),
            ),
          );
        }
      },
    );
  }
}

class SuccessFiltersBody extends StatefulWidget {
  const SuccessFiltersBody({
    super.key,
    required this.filtersList,
    required this.fromHome,
  });
  final bool fromHome;
  final List<dynamic> filtersList;

  @override
  State<SuccessFiltersBody> createState() => _SuccessFiltersBodyState();
}

class _SuccessFiltersBodyState extends State<SuccessFiltersBody> {
  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.filtersList.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index != selectedItem) {
              setState(() {
                if (!widget.fromHome) {
                  BlocProvider.of<SearchProductsCubit>(
                    context,
                  ).searchProductsByCategory(
                    category: widget.filtersList[index],
                  );
                }
                selectedItem = index;
              });
            }
          },
          child: FilterCard(
            title: widget.filtersList[index],
            selected: selectedItem == index,
          ),
        );
      },
    );
  }
}
