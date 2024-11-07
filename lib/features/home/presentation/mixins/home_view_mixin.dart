part of '../home_view.dart';

/// This mixin is used to separate the logic from the UI
mixin _HomeViewMixin on State<_HomeBody> {
  final searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  late TabController tabController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  /// This method is used to scroll to the selected category
  void scrollToSelectedCategory(int index) {
    // Calculate the position of the item
    final itemWidth = context.screenWidth; // Assume each pill has a fixed width (adjust accordingly)
    final scrollPosition = itemWidth * index;

    // Use the controller to scroll to that position
    scrollController.animateTo(
      scrollPosition,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
