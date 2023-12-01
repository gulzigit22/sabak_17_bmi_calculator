import 'package:flutter/material.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/pages/constants/app_text_styles.dart';

Future<void> showMyDialog({
  required BuildContext context,
  required String text,
  required double result,
}) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff0A001F),
          title: const Text(
            'Жыйынтык',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  '${result.toInt()}',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.smTextStyle,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Кайра эсепте'))
          ],
        );
      });
}
