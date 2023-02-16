import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/base/base_view_model.dart';

import 'components/tab_item.dart';

class HomeViewModel extends BaseViewModel {
  TabItem currentTab = TabItem.home;
  var bottomTabs = [
    TabItem.home,
    TabItem.report,
    TabItem.store,
    TabItem.warehouse
  ];

  final navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.report: GlobalKey<NavigatorState>(),
    TabItem.store: GlobalKey<NavigatorState>(),
    TabItem.warehouse: GlobalKey<NavigatorState>(),
  };

  void changeBottomTab({required TabItem tabItem}) async {
    if (tabItem == currentTab && currentTab == TabItem.home) {
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      currentTab = tabItem;
    }
    notifyListeners();
  }

  GlobalKey<NavigatorState>? get currentNavigatorKey =>
      navigatorKeys[currentTab];
}
