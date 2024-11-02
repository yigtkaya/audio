part of '../home_view.dart';

final class _CustomTabBarView extends StatelessWidget {
  final TabController tabController;

  const _CustomTabBarView(this.tabController);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h, // Adjust height accordingly
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDesignConstants.horizontalPaddingLarge,
        ),
        child: TabBarView(
          controller: tabController,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(
                  AppDesignConstants.borderRadius,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: AppDesignConstants.verticalPaddingLarge,
                        bottom: AppDesignConstants.verticalPaddingLarge,
                        left: AppDesignConstants.horizontalPaddingMedium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              "Product Name" * 2,
                              textAlign: TextAlign.start,
                              style: context.textTheme.titleSmall,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          SizedBox(
                            height: AppDesignConstants.verticalPaddingLarge,
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Shop Now",
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: AppColors.kPrimary,
                                ),
                              ),
                              SizedBox(
                                width: AppDesignConstants.horizontalPaddingMedium,
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                color: AppColors.kPrimary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppDesignConstants.horizontalPaddingLarge,
                  ),
                  Image.asset(
                    AssetConstants.images.headphone,
                  ),
                ],
              ),
            ),
            Center(child: Text('Content for Tab 2')),
            Center(child: Text('Content for Tab 3')),
            Center(child: Text('Content for Tab 4')),
          ],
        ),
      ),
    );
  }
}
