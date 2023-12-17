import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border:
              Border.all(color: const Color(0xff3FEDB2), width: 2)),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: const TabBar(
          dividerColor: Colors.transparent,
          labelColor: Color(0xff21232b),
          labelPadding: EdgeInsets.all(8),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Color(0xff3FEDB2),
          ),
          unselectedLabelColor: Color(0xff3FEDB2),
          tabs: [
            Tab(
              child: Text(
                "صاحب نقطة شحن",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SfArabic"),
              ),
            ),
            Tab(
              child: Text("صاحب مركبة",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SfArabic")),
            ),
          ]),
    );
  }
}
