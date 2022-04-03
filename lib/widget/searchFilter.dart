import 'package:flutter/material.dart';

class searchFilter extends StatefulWidget {
  String label;
  String search;
  ValueChanged<String>? changed;
  VoidCallback? tap;

   searchFilter({
    Key? key,
    this.tap,
    required this.label,
    this.search = "",
    this.changed,
  }) : super(key: key);

  @override
  _searchFilterState createState() => _searchFilterState();
}

class _searchFilterState extends State<searchFilter> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Color.fromRGBO(254, 238, 238, 1),
      ),
      width: double.infinity,
      height: 55,
      child: Center(
        child: TextField(
          controller: controller,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.label,
            prefixIcon: const Icon(Icons.search, color: Color.fromRGBO(246, 105, 105, 1)),
          ),
          onChanged: widget.changed,
          onTap: widget.tap,
        ),
      ),
    );
  }
}