import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/responsive.dart';
import '../../utils/utils.dart';

class CustomProgresBar extends StatelessWidget {
  final String? title;
  final int? currentPage;
  final int? totalPages;
  final double value;
  final double? paddingHorizontal;
  final Color? color;
  final Color? backgroundColor;
  const CustomProgresBar(
      {Key? key,
      this.title,
      this.currentPage,
      this.totalPages,
      required this.value,
      this.color,
      this.backgroundColor,
      this.paddingHorizontal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: Responsive.isMobile(context) ? size.width : 400,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal ?? defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: title != null
                      ? Text(
                          title ?? '',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2!
                              .copyWith(fontWeight: FontWeight.w600),
                        )
                      : Container(),
                ),
                if (currentPage != null && totalPages != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '$currentPage/$totalPages',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  )
              ],
            ),
            SizedBox(height: 8),
            Container(
              width: Responsive.isMobile(context) ? size.width : 400,
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.all(0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: LinearProgressIndicator(
                  minHeight: 12.0,
                  value: value,
                  color: color ?? AppColors.secondaryColor,
                  backgroundColor: backgroundColor ?? AppColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
