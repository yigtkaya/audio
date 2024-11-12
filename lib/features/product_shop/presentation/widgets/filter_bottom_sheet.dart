part of '../product_shop_view.dart';

final class _FilterBottomSheet extends StatelessWidget {
  const _FilterBottomSheet();

  @override
  Widget build(BuildContext context) {
    return const _FilterContent();
  }
}

final class _FilterContent extends StatefulWidget {
  const _FilterContent();

  @override
  State<_FilterContent> createState() => _FilterContentState();
}

class _FilterContentState extends State<_FilterContent> with _FilterContentMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingMedium,
          vertical: AppDesignConstants.verticalPaddingLarge,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onApplyFiltersPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimary,
              padding: EdgeInsets.symmetric(
                vertical: AppDesignConstants.verticalPaddingMedium,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDesignConstants.borderRadius,
                ),
              ),
            ),
            child: Text(
              context.l10n.applyFilter,
              style: context.textTheme.bodyLarge!.copyWith(
                color: AppColors.kWhite,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(AppDesignConstants.borderRadius),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n.filter,
                        style: context.textTheme.titleSmall,
                      ),
                      GestureDetector(
                        onTap: onClearFiltersPressed,
                        child: Text(
                          context.l10n.clear,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.kPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    context.l10n.category,
                    style: context.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 12.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 50.h,
                      child: Row(
                        children: ProductCategory.values.map(
                          (category) {
                            return Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: FilterChip(
                                selected: state.selectedCategory == category,
                                label: Text(
                                  category.getLocalizedName(context),
                                ),
                                onSelected: (selected) => onCategorySelected(category),
                                elevation: 1,
                                shadowColor: AppColors.kGreyDark,
                                backgroundColor: AppColors.kWhite,
                                selectedColor: AppColors.kPrimary,
                                checkmarkColor: AppColors.kWhite,
                                labelStyle: TextStyle(
                                  color: state.selectedCategory == category ? Colors.white : Colors.black,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    context.l10n.sortBy,
                    style: context.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: SortBy.values.map(
                      (sort) {
                        return FilterChip(
                          selected: state.selectedSort == sort,
                          label: Text(
                            sort.getLocalizedName(context),
                          ),
                          onSelected: (selected) => onSortBySelected(sort),
                          elevation: 1,
                          shadowColor: AppColors.kGreyDark,
                          backgroundColor: AppColors.kWhite,
                          selectedColor: AppColors.kPrimary,
                          checkmarkColor: AppColors.kWhite,
                          labelStyle: TextStyle(
                            color: state.selectedSort == sort ? Colors.white : Colors.black,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    context.l10n.priceRange,
                    style: context.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: minPriceController,
                          cursorColor: AppColors.kGrey,
                          decoration: InputDecoration(
                            hintText: context.l10n.minPrice,
                            hintStyle: context.textTheme.bodyMedium,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppDesignConstants.borderRadius,
                              ),
                              borderSide: BorderSide(
                                color: AppColors.kGrey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppDesignConstants.borderRadius,
                              ),
                              borderSide: BorderSide(
                                color: AppColors.kGrey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppDesignConstants.borderRadius,
                              ),
                              borderSide: BorderSide(
                                color: AppColors.kGrey,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) => onMinPriceChanged(value),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: TextField(
                          controller: maxPriceController,
                          cursorColor: AppColors.kGrey,
                          decoration: InputDecoration(
                            hintText: context.l10n.maxPrice,
                            hintStyle: context.textTheme.bodyMedium,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppDesignConstants.borderRadius,
                              ),
                              borderSide: BorderSide(
                                color: AppColors.kGrey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppDesignConstants.borderRadius,
                              ),
                              borderSide: BorderSide(
                                color: AppColors.kGrey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppDesignConstants.borderRadius,
                              ),
                              borderSide: BorderSide(
                                color: AppColors.kGrey,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) => onMaxPriceChanged(value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
