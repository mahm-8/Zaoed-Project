import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_bloc.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_event.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_state.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/loading_extension.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';
import 'package:zaoed/model/user_model.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({
    super.key,
    required this.user,
  });

  final UserModel? user;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is ErrorUploadState) {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.msg),
                  );
                });
          }
          if (state is UploadImageState) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is UploadImageState) {
            return ClipOval(
              child: Container(
                  height: context.getHeight(divide: 8),
                  width: context.getWidth(divide: 4),
                  decoration: BoxDecoration(
                    color: AppColors().gray6,
                  ),
                  child: Image.network(
                    state.url,
                    fit: BoxFit.cover,
                  )),
            );
          }
          return ClipOval(
            child: Container(
              height: context.getHeight(divide: 8),
              width: context.getWidth(divide: 4),
              decoration: BoxDecoration(
                color: AppColors().gray6,
              ),
              child: user?.imageProfile != null
                  ? Image.network(
                      user!.imageProfile!,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.person_outline),
            ),
          );
        },
      ),
      Positioned(
        top: 70,
        left: 0,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: AppColors().black,
              borderRadius: const BorderRadius.all(Radius.circular(100))),
          child: IconButton(
              padding: const EdgeInsets.only(right: 1),
              onPressed: () async {
                XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);

                final imageFile = await image!.readAsBytes();
                if (imageFile.isNotEmpty) {
                  context.read<UserBloc>().add(UploadImageEvent(imageFile));
                  context.showLoading();
                }
              },
              icon: Icon(Icons.add, color: AppColors().white)),
        ),
      ),
    ]);
  }
}
