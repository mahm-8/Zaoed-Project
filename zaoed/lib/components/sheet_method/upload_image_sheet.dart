import 'package:image_picker/image_picker.dart';
import 'package:zaoed/constants/imports.dart';

uploadImageSheet(BuildContext context) {
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
              const SizedBox(
                height: 8,
              ),
              Container(
                width: 100,
                height: 2,
                decoration: BoxDecoration(color: AppColors().gray),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors().gray6),
                height: 96,
                width: context.getWidth(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.camera);
                          final imageFile = await image!.readAsBytes();
                          if (imageFile.isNotEmpty) {
                            // ignore: use_build_context_synchronously
                            context
                                .read<UserBloc>()
                                .add(UploadImageEvent(imageFile));
                            // ignore: use_build_context_synchronously
                            context.showLoading();
                          }
                        },
                        child: Row(
                          children: [
                            Image.asset('lib/assets/icons/Camera.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'التقاط صورة',
                              style: const TextStyle().style8,
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
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          final imageFile = await image!.readAsBytes();
                          if (imageFile.isNotEmpty) {
                            // ignore: use_build_context_synchronously
                            context
                                .read<UserBloc>()
                                .add(UploadImageEvent(imageFile));
                            // ignore: use_build_context_synchronously
                            context.showLoading();
                          }
                        },
                        child: Row(
                          children: [
                            Image.asset('lib/assets/icons/Photo.png'),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('اختيار من معرض الصور',
                                style: const TextStyle().style8),
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
