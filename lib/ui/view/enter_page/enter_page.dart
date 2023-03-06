import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/utils/colors.gen.dart';

class EnterModule extends Module {
  @override
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          EnterPage.routeName,
          child: (context, args) => const EnterPage(),
        )
      ];
}


class EnterPage extends StatelessWidget {
  const EnterPage({Key? key}) : super(key: key);
  static const String routeName = '/enter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppWidgets.textLocale(
            localeKey: "Tilni tanglang / Выберите язык",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ColorName.black,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  height: 120,
                  width: 90,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/views/uzb.png",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 120,
                  width: 90,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/views/uzb_latin.png",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 120,
                  width: 90,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/views/rus.png",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
