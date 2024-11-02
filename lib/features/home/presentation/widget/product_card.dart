part of '../home_view.dart';

final class _ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;

  const _ProductCard({
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                imagePath,
                width: 120,
                height: 120,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppDesignConstants.horizontalPaddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: AppDesignConstants.verticalPaddingSmall,
                ),
                Text(
                  price,
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
