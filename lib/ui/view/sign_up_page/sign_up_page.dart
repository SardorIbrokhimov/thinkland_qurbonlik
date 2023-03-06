import 'package:cartouch/core/extensions/app_extensions.dart';
import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:cartouch/ui/view/phone_veritify/phone_veritify.dart';
import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpModule extends Module {
  @override
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SignUpPage.routeName,
          child: (context, args) => SignUpPage(),
        ),
      ];
}

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  static const String routeName = '/signup';

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Image(
              image: AssetImage("assets/images/views/sign_up_logo.png"),
            ),
          ).paddingOnly(top: 100),
          Center(
            child: AppWidgets.textLocale(
              fontSize: 24,
              localeKey: "Tizimga kirish",
              fontWeight: FontWeight.w600,
            ).paddingOnly(top: 45, bottom: 20),
          ),
          AppWidgets.textLocale(
            localeKey: "Telefon raqamingiz",
            color: const Color(0xFF828287),
          ).paddingOnly(left: 20),
          Container(
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            height: 48,
            child: InternationalPhoneNumberInput(
              //  initialValue: checknum(),
              // autoValidateMode: AutovalidateMode.onUserInteraction,
              onInputValidated: (value) {
                print(value);
              },

              errorMessage: "Invalid phone number",
              hintText: "Phone number",
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              selectorConfig: const SelectorConfig(
                setSelectorButtonAsPrefixIcon: true,
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              onSaved: (var text) {},

              onInputChanged: (PhoneNumber value) {},
              inputBorder: InputBorder.none,
              textFieldController: controller,
            ),
          ).paddingOnly(left: 20, right: 20, top: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PhoneVeritify(numbertext: controller.text),
                ),
              );
              print(
                  ">>>>>>>>>>>>>>>>>>.${controller.text}<<<<<<<<<<<<<<<<<<<<<<<<<<<");
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF00A9F4),
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              height: 48,
              child: Center(
                child: AppWidgets.textLocale(
                  localeKey: "Kirish",
                ),
              ),
            ).paddingOnly(left: 20, right: 20, top: 15),
          ),
        ],
      ),
    );
  }
}
