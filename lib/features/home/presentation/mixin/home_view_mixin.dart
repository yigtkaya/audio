part of '../home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  final searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  late TabController tabController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
