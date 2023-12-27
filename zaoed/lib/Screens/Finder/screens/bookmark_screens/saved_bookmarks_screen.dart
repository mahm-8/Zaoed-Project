import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class SavedBookmarksScreen extends StatelessWidget {
  const SavedBookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<ActionsBloc>().add(GetBookmarkEvent());

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
            BlocBuilder<ActionsBloc, ActionsState>(builder: (context, state) {
              if (state is GetBookmarkState) {
                print('ggggggggg');
                print("point location ${state.bookmarks}");
                if (state.bookmarks.isNotEmpty) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.bookmarks.length,
                      itemBuilder: (context, index) {
                        final bookmarks = state.bookmarks[index];
                        print('222222222222222');
                        return BookmarkCardWidget(
                          pointName: bookmarks.chargingPoint.pointName,
                          pointLocation: bookmarks.chargingPoint.pointLocation,
                          rating: bookmarks.chargingPoint.rating,
                          chargingTimes: bookmarks.chargingPoint.chargingTimes,
                          chargingPort: bookmarks.chargingPoint.chargingPort,
                          portCount: bookmarks.chargingPoint.portCount,
                          bookmarkID: bookmarks.bookmarkId,
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      "لا توجد أي نقاط شحن محفوظة حاليّا",
                      style: TextStyle(color: AppColors().gray4, fontSize: 19),
                    ),
                  );
                }
              } else {
                if (state is LoadingState) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColors().green,
                    strokeAlign: CircularProgressIndicator.strokeAlignCenter,
                    strokeWidth: 6,
                    strokeCap: StrokeCap.round,
                  ));
                }
              }
              return const Text("error");
            })
          ],
        ),
      ),
    );
  }
}
