import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/media_query_values.dart';

class XxErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const XxErrorWidget({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: Colors.amberAccent.shade700,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const Text(
            'something went wrong',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
        Text(
          'try again',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.textBlack,
            fontSize: 18,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 55,
          width: context.width * 0.55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.amber.shade200,
                backgroundColor: Colors.amber.shade700,
                elevation: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
            child: const Text(
              'reload screen',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}
