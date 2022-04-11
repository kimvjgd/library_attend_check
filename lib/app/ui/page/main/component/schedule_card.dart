import 'package:flutter/material.dart';
import 'package:library_attend_check/app/ui/page/constant/colors.dart';

class TodoCard extends StatelessWidget {
  final bool todoCheck;
  final String content;
  final Color color;

  const TodoCard(
      {required this.todoCheck,
      required this.content,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontWeight: FontWeight.w600, color: PRIMARY_COLOR, fontSize: 16.0);
    return Container(
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
            ),
            _TodoContent(content: content),
          ],
        ),
      ),
    );
  }
}

class TodoCheckBox extends StatelessWidget {
  final bool todoCheck;

  const TodoCheckBox({required this.todoCheck, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 20,
        height: 20,
        color: Colors.red,
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
