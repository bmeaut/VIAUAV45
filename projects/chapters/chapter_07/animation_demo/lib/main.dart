import 'package:animation_demo/res/app_theme.dart';
import 'package:animation_demo/view/components/app_bar.dart';
import 'package:animation_demo/view/components/page_indicator.dart';
import 'package:animation_demo/view/page1_animated_size.dart';
import 'package:animation_demo/view/page2_animated_container.dart';
import 'package:animation_demo/view/page3_curved_animation.dart';
import 'package:animation_demo/view/page4_animated_builder.dart';
import 'package:animation_demo/view/page5_staggered_animation.dart';
import 'package:animation_demo/view/page6_animated_svg.dart';
import 'package:animation_demo/view/page7_drawing_animation.dart';
import 'package:animation_demo/view/page8_lottie.dart';
import 'package:animation_demo/view/page9_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const AnimationDemo());
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  final _pageController = PageController(keepPage: false);
  int _pageIndex = 0;

  final List<Widget> _pages = <Widget>[
    const AnimatedSizeDemo(),
    const AnimatedContainerDemo(),
    const CurvedAnimationDemo(),
    const AnimatedBuilderDemo(),
    const StaggerDemo(),
    const AnimatedSvgDemo(),
    const DrawingAnimationDemo(),
    const LottieDemo(),
    const RiveAnimationDemo(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int newPage) => setState(() {
        _pageIndex = newPage;
      });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: AppTheme.systemUiOverlayStyle,
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
        designSize: const Size(400, 800),
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.main,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            body: Column(
              children: [
                CustomAppBar(pageIndex: _pageIndex),
                Expanded(
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    allowImplicitScrolling: true,
                    children: _pages,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: PageIndicator(
              pageCount: _pages.length,
              currentPage: _pageIndex,
            ),
          ),
        ),
      ),
    );
  }
}
