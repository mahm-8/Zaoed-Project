import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class SavedBookmarksScreen extends StatelessWidget {
  const SavedBookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ActionsBloc>().add(GetBookmarkEvent());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors().gray9,
      appBar: customAppBar(context, title: "المحفوظات", showIcon: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            color: AppColors().gray6,
            height: 1,
          ),
          const SizedBox(
            height: 17,
          ),
          BlocBuilder<ActionsBloc, ActionsState>(
              buildWhen: (previous, current) {
            if (current is GetBookmarkState) {
              return true;
            }
            return false;
          }, builder: (context, state) {
            if (state is GetBookmarkState) {
              if (state.bookmarks.isNotEmpty) {
                return SizedBox(
                  width: context.getWidth(),
                  height: context.getHeight(divide: 1.3),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: state.bookmarks.length,
                      itemBuilder: (context, index) {
                        final bookmarks = state.bookmarks[index];
                        return BookmarkCardWidget(
                          pointName: bookmarks.chargingPoint.pointName,
                          rating: bookmarks.chargingPoint.rating,
                          chargingTimes: bookmarks.chargingPoint.chargingTimes,
                          chargingPort: bookmarks.chargingPoint.chargingPort,
                          portCount: bookmarks.chargingPoint.portCount,
                          bookmarkID: bookmarks.bookmarkId,
                          longitude: bookmarks.chargingPoint.longitude,
                          latitude: bookmarks.chargingPoint.latitude,
                          pointID: bookmarks.chargingPoint.pointId,
                        );
                      }),
                );
              } else {
                return Center(
                  child: Text(
                    "لا توجد أي نقاط شحن محفوظة حاليّا",
                    style: const TextStyle().style20,
                  ),
                );
              }
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors().green,
                strokeAlign: CircularProgressIndicator.strokeAlignCenter,
                strokeWidth: 6,
                strokeCap: StrokeCap.round,
              ));
            }
          })
        ],
      ),
    );
  }
}
