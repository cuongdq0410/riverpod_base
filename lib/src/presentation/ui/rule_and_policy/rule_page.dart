import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/presentation/ui/widget/common_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RulePage extends StatelessWidget {
  const RulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Điều khoản'),
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
              'Thỏa thuận Điều khoản sử dụng là gì?',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Thỏa thuận điều khoản sử dụng xác định các quy tắc sử dụng trang web. Đôi khi được gọi là "điều khoản và điều kiện", tài liệu này bao gồm các tuyên bố từ chối trách nhiệm và thông báo làm rõ giới hạn trách nhiệm pháp lý của trang web hoặc doanh nghiệp đối với khách truy cập. Nó cũng thường hiển thị các thông tin khác về quyền sở hữu và bản quyền trang web để giúp bảo vệ nội dung của trang web. Và nó có thể chứa chính sách bảo mật giải thích cách bạn thu thập và sử dụng thông tin khách hàng hoặc khách truy cập. Do ngôn ngữ cụ thể và sự đa dạng trong phạm vi nhu cầu của các trang web, các tài liệu này nên được tạo ra với sự trợ giúp của các chuyên gia pháp lý để được bảo vệ pháp lý tối đa.',
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
