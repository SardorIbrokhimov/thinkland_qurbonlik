import 'package:cartouch/core/utils/assets.gen.dart';
import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final VoidCallback? delete;
  final String path;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  const ImageContainer({
    required this.path,
    this.onTap,
    this.delete,
    this.padding = const EdgeInsets.all(5),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: path,
      child: Padding(
        padding: padding,
        child: InkWell(
          onTap: () {
            AppWidgets.openImgDialog(context: context, imgPath: path);
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppWidgets.imageFile(
                  path: path,
                  height: 83,
                  width: 105,
                ),
              ),
              Positioned(
                bottom: 9,
                left: 7,
                child: AppWidgets.iconButton(
                  onPressed: delete ?? () {},
                  icon: Assets.images.icons.trahIcon,
                  height: 24,
                  width: 24,
                  bgColor: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
