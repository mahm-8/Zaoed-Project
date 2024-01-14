import 'package:zaoed/constants/imports.dart';

class PersonalImageContainer extends StatelessWidget {
  const PersonalImageContainer({
    super.key,
    this.user,
  });
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 16),
      child: Stack(
        children: [
          ClipOval(
              child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is ErrorPoviderUploadState) {
                context.pop();
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(state.msg),
                      );
                    });
              }
              if (state is PoviderImageState) {
                context.pop();
                context.pop();
              }
            },
            builder: (context, state) {
              if (state is PoviderImageState) {
                return Container(
                    height: context.getHeight(divide: 8),
                    width: context.getWidth(divide: 4),
                    color: AppColors().gray6,
                    child: Image.network(state.url));
              }
              return Container(
                  height: context.getHeight(divide: 8),
                  width: context.getWidth(divide: 4),
                  color: AppColors().gray6,
                  child: user?.imageProfile != null
                      ? Image.network(user!.imageProfile!)
                      : ImageIcon(
                          const AssetImage('lib/assets/icons/person_prof.png'),
                          color: AppColors().white,
                        ));
            },
          )),
          Positioned(
            top: 71,
            left: 0,
            child: InkWell(
              onTap: () {
                uploadImageSheet(context);
              },
              child: ClipOval(
                child: Container(
                    width: 20,
                    height: 20,
                    color: AppColors().gray9,
                    child: Image.asset('lib/assets/icons/plus_w.png')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
