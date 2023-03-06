import 'package:cartouch/core/extensions/app_extensions.dart';
import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroModule extends Module {
  @override
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          IntroPage.routeName,
          child: (context, args) => IntroPage(),
        ),
      ];
}

// ignore: must_be_immutable
class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);
  static const String routeName = '/intro';

  final List _containers = [
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/views/intro_1.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppWidgets.textLocale(
                  localeKey: "Ehsonsiz jannatga erishib bo'lmaydi!",
                  textAlign: TextAlign.start,
                  color: ColorName.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)
              .paddingOnly(
            left: 20,
            bottom: 100,
          ),
        ],
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/views/intro_2.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          AppWidgets.textLocale(
                  localeKey: "Ehson - yaxshilik qilish ma'nosini anglatadi",
                  maxLines: 2,
                  fontSize: 25,
                  fontWeight: FontWeight.w700)
              .paddingOnly(top: 100, left: 100, right: 15),
          AppWidgets.textLocale(
            localeKey:
                "Yaxshilik qiluvchilarga bu dunyoning o'zida ham yaxshilik bor",
            fontSize: 16,
            maxLines: 2,
            color: const Color(0xFF6D6560),
          ).paddingOnly(left: 100, right: 15, top: 10),
        ],
      ),
    ),
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/views/intro_3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.textLocale(
                  localeKey: "Yaxshilik qiling!",
                  textAlign: TextAlign.start,
                  color: ColorName.white,
                  maxLines: 1,
                  fontSize: 25,
                  fontWeight: FontWeight.w700)
              .paddingOnly(
            left: 20,
            bottom: 10,
          ),
          AppWidgets.textLocale(
                  localeKey:
                      """"Yaxshilik qil, jahon yaxshilik olsin,\nYaxshilar boshiga yaxshilik solsin.\nMol-dunyo barchadin—sendan ham qolur,\nYaxshisi mol emas, yaxshilik qolsin.""",
                  maxLines: 4,
                  color: ColorName.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)
              .paddingOnly(left: 20, bottom: 10),
          AppWidgets.textLocale(
                  localeKey: "- Abdurahmon Jomiy ",
                  maxLines: 1,
                  color: ColorName.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)
              .paddingOnly(
            left: 20,
            bottom: 50,
          ),
        ],
      ),
    ),
  ];

  PageController controllerpage = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              _containers[0],
              _containers[1],
              _containers[2],
            ],
            controller: controllerpage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: controllerpage,
                count: _containers.length,
                effect: const JumpingDotEffect(
                  activeDotColor: Color(0xFF00A9F4),
                  dotColor: ColorName.white,
                  dotWidth: 12,
                  dotHeight: 12,
                ),
              ),
            ],
          ).paddingOnly(top: 55),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A9F4),
        mini: true,
        onPressed: () {
          controllerpage.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.ease);
          print(controllerpage.keepPage);
        },
        child: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 15,
        ),
      ),
    );
  }
}
