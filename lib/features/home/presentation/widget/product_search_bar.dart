part of '../home_view.dart';

final class _ProductSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  const _ProductSearchBar(this.searchController);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingLarge,
        ),
        child: Column(
          children: [
            CustomSearchTextFormField(
              controller: searchController,
              hintText: context.l10n.searchHeadphone,
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}
