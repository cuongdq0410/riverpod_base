import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/main_home/main_home_page.dart';

enum TabItem {
  home,
  report,
  store,
  warehouse,
}

extension TabItemExtend on TabItem {
  String get getTabName {
    switch (this) {
      case TabItem.home:
        return 'Trang chủ';
      case TabItem.report:
        return 'Báo cáo';
      case TabItem.store:
        return 'Cửa hàng';
      case TabItem.warehouse:
        return 'Kho';
    }
  }

  Widget getIcon(Color color) {
    switch (this) {
      case TabItem.home:
        return Assets.images.icHome.svg(
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
        );
      case TabItem.report:
        return Assets.images.icReport.svg(
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
        );
      case TabItem.store:
        return Assets.images.store.svg(
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
        );
      case TabItem.warehouse:
        return Assets.images.warehouse.svg(
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
        );
    }
  }

  Widget page(
    TabItem currentTabItem,
    GlobalKey<NavigatorState>? key,
  ) {
    switch (this) {
      case TabItem.home:
        return Offstage(
          offstage: currentTabItem != this,
          child: const MainHomePage(),
        );
      case TabItem.report:
        return Offstage(
          offstage: currentTabItem != this,
          child: SizedBox(
            child: Center(child: Text(getTabName)),
          ),
        );
      case TabItem.store:
        return Offstage(
          offstage: currentTabItem != this,
          child: SizedBox(
            child: Center(child: Text(getTabName)),
          ),
        );
      case TabItem.warehouse:
        return Offstage(
          offstage: currentTabItem != this,
          child: SizedBox(
            child: Center(child: Text(getTabName)),
          ),
        );
    }
  }
}
