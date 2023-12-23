// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

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
      width: MediaQuery.of(context).size.width,
      child: TabBar(
          controller: controller,
          onTap: (select) {
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
          tabs: const [
            Tab(
              child: Text(
                "صاحب نقطة شحن",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Tab(
              child: Text("صاحب مركبة",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ]),
    );
  }
}
