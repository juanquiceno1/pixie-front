import 'package:flutter/material.dart';
import '../images/custom_image.dart';

class AlertExit extends StatelessWidget {
  const AlertExit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      titleTextStyle: TextStyle(
        fontSize: 20,
        // color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomImage(image: 'assets/logo-iexpert.svg', height: 60),
          ),
          Text(
            '¿Seguro quieres salir de la aplicación?',
            style: Theme.of(context).primaryTextTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Salir'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Cancelar'),
        )
      ],
    );
  }
}
