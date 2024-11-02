part of '../home_view.dart';

final class _ProdcutSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  const _ProdcutSearchBar(this.searchController);

  @override
  Widget build(BuildContext context) {
    return CustomSearchTextFormField(
      controller: searchController,
      hintText: context.l10n.searchHeadphone,
    );
  }
}
