import 'package:flutter/material.dart';
import 'package:library_attend_check/app/ui/basic_components/todo_colors.dart';
import 'package:library_attend_check/app/ui/page/constant/colors.dart';

class TodoCard extends StatelessWidget {
  final bool todoCheck;
  final String content;
  final String colorString;

  const TodoCard(
      {required this.todoCheck,
      required this.content,
      required this.colorString,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontWeight: FontWeight.w600, color: PRIMARY_COLOR, fontSize: 16.0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: PRIMARY_COLOR),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              TodoCheckBox(
                todoCheck: todoCheck,
                colorString: colorString,
              ),
              _TodoContent(content: content),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoCheckBox extends StatelessWidget {
  final bool todoCheck;
  final String colorString;

  const TodoCheckBox({required this.todoCheck, required this.colorString, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 20,
        height: 20,
        color: todoColors[int.parse(colorString)][1],
      ),
    );
  }
}

class _TodoContent extends StatelessWidget {
  final String content;

  const _TodoContent({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(content);
  }
}
