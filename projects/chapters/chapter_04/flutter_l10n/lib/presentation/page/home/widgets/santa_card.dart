import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/presentation/page/home/details/details_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SantaCard extends StatelessWidget {
  final Santa santa;

  const SantaCard({super.key, required this.santa});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder<void>(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return AnimatedBuilder(
                animation: animation,
                builder: (_, Widget? child) {
                  return Opacity(
                    opacity: animation.value,
                    child: DetailPage(santa: santa),
                  );
                },
              );
            },
            transitionDuration: const Duration(milliseconds: 400),
          ),
        );
      },
      child: Stack(
        children: [
          Hero(
            tag: "background_${santa.name}",
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 16.w,
                  top: 160.h,
                  bottom: 16.h,
                ),
                child: Text(
                  santa.name,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: 16.w,
            top: 32.h,
            child: Hero(
              tag: "image_${santa.name}",
              child: Image.asset(santa.avatar, height: 114.h, width: 171.w),
            ),
          ),
        ],
      ),
    );
  }
}
