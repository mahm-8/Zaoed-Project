import 'package:zaoed/constants/imports.dart';

class SavedBookmarksScreen extends StatefulWidget {
  const SavedBookmarksScreen({super.key});

  @override
  State<SavedBookmarksScreen> createState() => _SavedBookmarksScreenState();
}

class _SavedBookmarksScreenState extends State<SavedBookmarksScreen> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetBookmarkEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: customAppBar(context, title: "المحفوظات"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: AppColors().gray6,
              height: 1,
            ),
            const SizedBox(
              height: 17,
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is GetBookmarkState) {
                  if (state.bookmarks!.isNotEmpty) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.bookmarks?.length,
                        itemBuilder: (context, index) {
                          final bookmarks = state.bookmarks?[index];
                          return BookmarkCardWidget(
                            name: bookmarks?.bookmarkName,
                            rate: bookmarks?.rating,
                            location: bookmarks?.location,
                            chargingTimes: bookmarks?.chrgingTimes,
                            idAuth: bookmarks?.idAuth,
                          );
                        });
                  } else {
                    return Center(
                      child: Text(
                        "لا توجد أي نقاط شحن محفوظة حاليّا",
                        style:
                            TextStyle(color: AppColors().gray4, fontSize: 19),
                      ),
                    );
                  }
                } else if (state is ErrorState) {
                  LoadingExtension(context).showLoading();
                }
                return const Center();
              },
            ),
          ],
        ),
      ),
    );
  }
}
