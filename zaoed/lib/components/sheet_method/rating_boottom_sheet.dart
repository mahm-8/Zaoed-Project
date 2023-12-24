import 'package:flutter/material.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';

RaitingBottomSheet(BuildContext context, {String name = 'سلوى'}) {
  showModalBottomSheet(
    backgroundColor: AppColors().gray6,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors().gray),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'شكراً $name لاستخدامك نقطة الشحن',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors().white),
            ),
            const SizedBox(height: 8),
            Text(
              '''قيم تجربتك لمساعدتنا في تطوير وتحسين خدماتنا 
                    وتقديم تجربة مميزة لكم 🤩.''',
              style: TextStyle(fontSize: 16, color: AppColors().white),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    const AssetImage('lib/assets/icons/Star 5.png'),
                    color: AppColors().green,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    const AssetImage('lib/assets/icons/Star 5.png'),
                    color: AppColors().green,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    const AssetImage('lib/assets/icons/Star 5.png'),
                    color: AppColors().green,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    const AssetImage('lib/assets/icons/Star 5.png'),
                    color: AppColors().green,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    const AssetImage('lib/assets/icons/Star 5.png'),
                    color: AppColors().green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'قيم تجربتك هنا...',
                hintStyle: TextStyle(color: AppColors().gray),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors().green)),
              ),
            ),
            const SizedBox(height: 20),
            ButtonWidget(
                textEntry: 'إرسال',
                backColor: AppColors().green,
                onPress: () {},
                textColor: AppColors().black)
          ],
        ),
      );
    },
  );
}
