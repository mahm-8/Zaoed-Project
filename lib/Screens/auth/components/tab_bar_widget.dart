// ignore_for_file: must_be_immutable

import 'package:zaoed/constants/imports.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget({
    super.key,
    required this.controller,
  });
  String type = "povider";
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xff3FEDB2), width: 2)),
      height: 50,
      width: context.getWidth(),
      child: TabBar(
          controller: controller,
          onTap: (select) {
            context.read<PagesBloc>().add(PageTabBarLoginEvent(select));
            context.read<PagesBloc>().add(PageTabBarSignupEvent(select));
            select == 1 ? type = "finder" : type = "povider";
          },
          dividerColor: Colors.transparent,
          labelColor: const Color(0xff21232b),
          labelPadding: const EdgeInsets.all(8),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(
            color: Color(0xff3FEDB2),
          ),
          unselectedLabelColor: const Color(0xff3FEDB2),
          tabs:  [
            Tab(
              child: Text(
                "صاحب نقطة شحن",
                style: const TextStyle().style14,
              ),
            ),
            Tab(
              child: Text("صاحب مركبة",
                  style: const TextStyle().style14,),
            ),
          ]),
    );
  }
}
