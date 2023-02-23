import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/base/base_stateless_view.dart';
import 'package:flutter_clean_architecture/src/presentation/di/view_model_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/home/home_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/bottom_navigation.dart';
import 'components/tab_item.dart';

const homePageRoutes = '/home_page';

class HomePage extends BaseStatelessView<HomeViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget createView(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final homeRef = ref.watch(viewModelProvider);
        return Scaffold(
          body: Stack(
            children: homeRef.bottomTabs
                .map(
                  (bottomItem) => bottomItem.page(
                    homeRef.currentTab,
                    homeRef.currentNavigatorKey,
                  ),
                )
                .toList(),
          ),
          bottomNavigationBar: BottomNavigation(
            currentTab: homeRef.currentTab,
            onSelectTab: (selectTab) {
              homeRef.changeBottomTab(tabItem: selectTab);
            },
          ),
        );
      },
    );
  }

  @override
  ProviderBase<HomeViewModel> get viewModelProvider => homeViewModel;
}
