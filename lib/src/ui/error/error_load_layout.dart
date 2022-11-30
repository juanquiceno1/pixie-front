import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes.dart';
import '../../utils/responsive.dart';
import '../../widgets/buttons/custon_elevated_button.dart';
import '../../widgets/images/custom_image.dart';

class ErrorLoadLayoud extends StatefulWidget {
  const ErrorLoadLayoud({Key? key}) : super(key: key);
  @override
  State<ErrorLoadLayoud> createState() => _ErrorLoadLayoudState();
}

class _ErrorLoadLayoudState extends State<ErrorLoadLayoud> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0),
                    FittedBox(
                      child: CustomImage(
                        image: 'assets/404.svg',
                        fit: BoxFit.contain,
                        height: size.height * 0.4,
                        width: size.height * 0.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Ooops!',
                      style: Theme.of(context).primaryTextTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text('No pudimos encontrar la sección que buscas',
                        style: Theme.of(context).primaryTextTheme.bodyText2,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.4
                          : Responsive.isTablet(context)
                              ? size.width * 0.5
                              : size.width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: CustomElevatedButton(
                            text: 'Regresar',
                            onPressed: () {
                              context.pop();
                            }),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                tooltip: 'Ir a inicio de sesión',
                onPressed: () {
                  // context.goNamed(GoRouters.incomeOptionRoute);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  // color: AppColors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
