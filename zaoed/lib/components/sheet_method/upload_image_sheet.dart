import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

UploadImageSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: AppColors().gray6,
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: context.getWidth(),
          height: 200,
          decoration: BoxDecoration(
              color: AppColors().gray9, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                width: 100,
                height: 2,
                decoration: BoxDecoration(color: AppColors().gray),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors().gray6),
                height: 96,
                width: 350,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          // XFile? image = await picker.pickImage(source: ImageSource.gallery);
                        },
                        child: Row(
                          children: [
                            Image.asset('lib/assets/icons/Camera.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'التقاط صورة',
                              style: TextStyle(color: AppColors().white),
                            ),
                            const Spacer(),
                            Image.asset('lib/assets/icons/small-left-solid.png')
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors().gray9,
                        thickness: 1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset('lib/assets/icons/Photo.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('اختيار من معرض الصور',
                                style: TextStyle(color: AppColors().white)),
                            const Spacer(),
                            Image.asset('lib/assets/icons/small-left-solid.png')
                          ],
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        );
      });
}
