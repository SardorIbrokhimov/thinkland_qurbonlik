import 'package:cartouch/core/extensions/app_extensions.dart';
import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pinput/pinput.dart';

class PhoneVeritifyModule extends Module {
  @override
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          PhoneVeritify.routeName,
          child: (context, args) => PhoneVeritify(
            numbertext: '',
          ),
        ),
      ];
}

class PhoneVeritify extends StatelessWidget {
  String numbertext;

  PhoneVeritify({required this.numbertext});
  static const String routeName = '/phonever';
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Modular.to.pop();
            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A9F4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 15,
                    color: Color(0xFFF3DBDB),
                  ),
                ),
                AppWidgets.textLocale(
                        localeKey: "Orqaga",
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF828287),
                        fontSize: 16)
                    .paddingOnly(
                  left: 12,
                ),
              ],
            ).paddingOnly(
              top: 50,
            ),
          ),
          AppWidgets.textLocale(
                  localeKey: "Telefon raqamingizni tasdiqlang!",
                  maxLines: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.w700)
              .paddingOnly(top: 20),
          AppWidgets.textLocale(
                  color: const Color(0xFF323240),
                  localeKey:
                      " $numbertext raqamiga 6 xonalik kod yubordik ushbu kodni kiriting",
                  maxLines: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)
              .paddingOnly(top: 20),
          AppWidgets.textLocale(
                  color: const Color(0xFF323240),
                  localeKey: "Kodni kiriting",
                  maxLines: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)
              .paddingOnly(top: 40),
          Pinput(
            length: 6,
            defaultPinTheme: PinTheme(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorName.white,
              ),
            ),
            submittedPinTheme: PinTheme(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF00A9F4),
                ),
                borderRadius: BorderRadius.circular(8),
                color: ColorName.white,
              ),
            ),
          ).paddingOnly(top: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Modular.to.navigate("/personaldata");
                },
                child: Container(
                  //  backgroundColor: Color(0xFF00A9F4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A9F4),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ).paddingAll(10),
                ),
              ).paddingOnly(top: 30, left: 50),
            ],
          ),
        ],
      ).paddingOnly(top: 20, left: 20, right: 20),
    );
  }
}
