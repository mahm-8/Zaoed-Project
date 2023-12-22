import 'package:flutter/material.dart';
import 'package:zaoed/components/appbar/appbar_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'components/bookmark_card_widget.dart';

class SavedBookmarksScreen extends StatelessWidget {
  SavedBookmarksScreen({super.key});

  final List bookmarks = ["", ""];
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
            if (bookmarks.isEmpty)
              Center(
                child: Text(
                  "لا توجد أي نقاط شحن محفوظة حاليّا",
                  style: TextStyle(color: AppColors().gray4, fontSize: 19),
                ),
              ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bookmarks.length,
                itemBuilder: (context, index) {
                  return const BookmarkCardWidget();
                }),
          ],
        ),
      ),
    );
  }
}
