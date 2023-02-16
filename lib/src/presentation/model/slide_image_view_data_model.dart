import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/base/model_item.dart';

class SlideImageViewDataModel with ModelItem {
  final String title;
  final Widget image;

  SlideImageViewDataModel({required this.image, required this.title});
}

List slideImages = [
  SlideImageViewDataModel(
    image: Assets.images.icSecondSlide.svg(),
    title: 'Ứng dụng quản lý toàn diện dành\ncho chủ cửa hàng',
  ),
  SlideImageViewDataModel(
    image: Assets.images.icFirstSlide.svg(),
    title: 'Thông tin được chưng bày trực quan\n',
  ),
  SlideImageViewDataModel(
    image: Assets.images.icThirdSlide.svg(),
    title: 'Kết hợp và hỗ trợ từ nhà cung cấp\ngiặt là sạch cộng',
  ),
];
