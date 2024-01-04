import 'package:zaoed/constants/imports.dart';

class DropMenu extends StatelessWidget {
  const DropMenu({
    super.key,
    required this.list,
  });

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownMenu<String>(
        trailingIcon: Icon(
          Icons.keyboard_arrow_down_sharp,
          color: AppColors().white,
        ),
        menuStyle: MenuStyle(
          visualDensity: const VisualDensity(horizontal: -2),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          backgroundColor: MaterialStatePropertyAll(AppColors().gray6),
        ),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.only(right: 8),
            isCollapsed: true,
            focusedBorder: OutlineStyle.default15Outline,
            enabledBorder: OutlineStyle.default15Outline,
            fillColor: AppColors().gray6,
            filled: true,
            outlineBorder: BorderSide.none),
        width: context.getWidth(divide: 1.1),
        textStyle: TextStyle(color: AppColors().white),
        initialSelection: list.first,
        onSelected: (String? value) {
          // setState(() {
          //   dropdownValue = value!;
          // });
        },
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(
              value: value,
              label: value,
              style:
                  MenuItemButton.styleFrom(foregroundColor: AppColors().white));
        }).toList(),
      ),
    );
  }
}
