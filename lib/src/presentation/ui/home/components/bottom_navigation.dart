import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/di/view_model_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/utils/dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'tab_item.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({
    Key? key,
    required this.currentTab,
    required this.onSelectTab,
  }) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorName.greyF0F0F0,
            spreadRadius: 1.5,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItem(TabItem.home, ref),
            _buildItem(TabItem.report, ref),
            InkWell(
              onTap: () {},
              child: Assets.images.icPlus.svg(),
            ),
            _buildItem(TabItem.store, ref),
            _buildItem(TabItem.warehouse, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(TabItem tabItem, WidgetRef ref) {
    Color color = ref.watch(homeViewModel).currentTab == tabItem
        ? ColorName.blue0093D5
        : ColorName.greyAEBDD4;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          onSelectTab(tabItem);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 10.w, bottom: 8.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              tabItem.getIcon(color),
              SizedBox(height: 3.w),
              Text(
                tabItem.getTabName,
                style: TextStyle(
                  color: color,
                  fontSize: Dimensions.mFontSize10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
