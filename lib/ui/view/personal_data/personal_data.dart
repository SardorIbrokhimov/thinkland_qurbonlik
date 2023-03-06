import 'package:cartouch/core/extensions/app_extensions.dart';
import 'package:cartouch/core/utils/assets.gen.dart';
import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:cartouch/ui/view/personal_data/widgets/personal_data_widgets.dart';
import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PersonalDataModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          PersonalDataPage.routename,
          child: (context, args) => PersonalDataPage(),
        ),
      ];
}

class PersonalDataPage extends StatefulWidget {
  static const String routename = "/personaldata";
  const PersonalDataPage({super.key});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  bool male = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.textLocale(
                    localeKey: "Shaxsiy ma'lumotlarni kiriting",
                    maxLines: 2,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)
                .paddingOnly(top: 50, right: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: ColorName.mainColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Assets.images.views.person.svg().center,
                        ).paddingOnly(top: 20),
                      ),
                    ]),
              ],
            ),
            AppWidgets.textLocale(
              localeKey: "Ismingiz",
              color: const Color(0xFF828287),
            ).paddingOnly(top: 20, right: 20, bottom: 10),
            Container(
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              height: 48,
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Ismingizni kiriting",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFDCDCE1),
                  ),
                ),
              ),
            ),
            AppWidgets.textLocale(
              localeKey: "Familiyangiz",
              color: const Color(0xFF828287),
            ).paddingOnly(top: 20, right: 20, bottom: 10),
            Container(
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              height: 48,
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Familiyangizni kiriting",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFDCDCE1),
                  ),
                ),
              ),
            ),
            AppWidgets.textLocale(
              localeKey: "Jinsingiz",
              color: const Color(0xFF828287),
            ).paddingOnly(top: 20, right: 20, bottom: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      male = true;
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: male ? ColorName.mainColor : ColorName.white,
                    ),
                    child: Row(
                      children: [
                        Assets.images.views.person
                            .svg(
                                width: 20,
                                height: 20,
                                color: male
                                    ? ColorName.white
                                    : ColorName.mainColor)
                            .paddingOnly(
                                top: 5, bottom: 5, right: 20, left: 20),
                        AppWidgets.textLocale(
                            localeKey: "Erkak",
                            color: male ? ColorName.white : ColorName.black),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      male = false;
                    });
                    print(male);
                  },
                  child: Container(
                    height: 48,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: male ? ColorName.white : ColorName.mainColor,
                    ),
                    child: Row(children: [
                      Assets.images.views.personFemale
                          .svg(
                              width: 20,
                              height: 20,
                              color:
                                  male ? ColorName.mainColor : ColorName.white)
                          .paddingOnly(top: 5, bottom: 5, right: 20, left: 20),
                      AppWidgets.textLocale(
                          localeKey: "Ayol",
                          color: male ? ColorName.black : ColorName.white),
                    ]),
                  ),
                ),
              ],
            ),
            AppWidgets.textLocale(
              localeKey: "Tug'ilgan sanangiz",
              color: const Color(0xFF828287),
            ).paddingOnly(top: 20, right: 20, bottom: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DateTimeWidget(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: double.infinity,
                height: 48,
                child: Assets.images.views.calendar.svg(),
              ),
            ),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
