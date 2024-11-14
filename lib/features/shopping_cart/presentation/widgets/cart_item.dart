part of '../shopping_cart_view.dart';

final class _CartItem extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;
  final Function(int) onUpdateQuantity;

  const _CartItem({
    required this.item,
    required this.onRemove,
    required this.onUpdateQuantity,
  });

  void _handleIncrement() {
    onUpdateQuantity(item.quantity + 1);
  }

  void _handleDecrement() {
    if (item.quantity > 1) {
      onUpdateQuantity(item.quantity - 1);
    } else {
      onRemove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDesignConstants.horizontalPaddingMedium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.circular(
                AppDesignConstants.borderRadius,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                AppDesignConstants.borderRadius,
              ),
              child: CachedNetworkImage(
                imageUrl: item.photo,
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
            ),
          ),
          SizedBox(
            width: AppDesignConstants.horizontalPaddingLarge,
          ),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: AppDesignConstants.horizontalPaddingSmall,
                ),
                Text(
                  'USD ${item.price}',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: AppDesignConstants.horizontalPaddingMedium,
                ),

                // Quantity Controls
                Row(
                  children: [
                    // Decrement Button
                    _QuantityButton(
                      onTap: _handleDecrement,
                      icon: Icons.remove,
                    ),

                    // Quantity Display
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDesignConstants.horizontalPaddingLarge,
                      ),
                      child: Text(
                        '${item.quantity}',
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    // Increment Button
                    _QuantityButton(
                      onTap: _handleIncrement,
                      icon: Icons.add,
                    ),

                    const Spacer(),

                    // Delete Button
                    IconButton(
                      onPressed: onRemove,
                      icon: const Icon(LucideIcons.trash),
                      color: AppColors.kGrey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final class _QuantityButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const _QuantityButton({
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          2,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.kGrey.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusSmall,
          ),
        ),
        child: Icon(
          icon,
          size: AppDesignConstants.iconSize,
        ),
      ),
    );
  }
}
