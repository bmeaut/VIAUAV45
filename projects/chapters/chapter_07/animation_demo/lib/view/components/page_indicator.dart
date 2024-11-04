import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/res/app_theme.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.pageCount,
    required this.currentPage,
  });

  final int pageCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.paddingOf(context).bottom + AppDimensions.h40,
      color: AppTheme.transparent,
      alignment: Alignment.topCenter,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimensions.w12),
          height: currentPage == index ? AppDimensions.h12 : AppDimensions.h8,
          width: currentPage == index ? AppDimensions.h12 : AppDimensions.h8,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(currentPage == index ? 1.0 : 0.5),
            shape: BoxShape.circle,
          ),
        ),
        itemCount: pageCount,
      ),
    );
  }
}
