import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Chính sách quyền riêng tư'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              'Hiệu lực từ 00/00/0000',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ColorName.greyA6A6A6,
                  ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Chúng tôi coi trọng sự riêng tư của bạn.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Để nâng cao, cá nhân hóa và hỗ trợ trải nghiệm của bạn trên Trang web, trong số những thứ khác, chúng tôi thu thập, sử dụng và chia sẻ thông tin người dùng của bạn. Ví dụ: chúng tôi sử dụng thông tin tổng hợp để phát triển nội dung hướng đến sở thích của người dùng và để cải thiện chung trải nghiệm người dùng của Trang web.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    height: 1.4,
                  ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Thông tin được thu thập',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Khi bạn sử dụng Trang web, thông tin người dùng của bạn có thể được thu thập, sử dụng và chia sẻ theo nhiều cách khác nhau. Như được trình bày chi tiết bên dưới, loại thông tin người dùng được thu thập có thể khác nhau, nhưng có thể bao gồm, trong số những thứ khác, thông tin người dùng mà bạn tự nguyện gửi',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    height: 1.4,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

