import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/data/repository/todo_repository.dart';
import 'package:library_attend_check/app/ui/basic_components/todo_colors.dart';
import 'package:logger/logger.dart';

class TodoBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const TodoBottomSheet({required this.selectedDate, Key? key})
      : super(key: key);

  @override
  State<TodoBottomSheet> createState() => _TodoBottomSheetState();
}

class _TodoBottomSheetState extends State<TodoBottomSheet> {

  String selectedColor = '0';
  TextEditingController _subjectController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<dynamic> tempListForReturn = [];

  @override
  void dispose() {
    _subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset =
        MediaQuery.of(context).viewInsets.bottom; // 키보드가 차지하는 부분

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: formKey,
          child: Container(
              height: Get.height / 2 + bottomInset,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomInset),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.selectedDate.year} / ${widget.selectedDate.month} / ${widget.selectedDate.day}',
                        style: TextStyle(
                            fontSize: 30, color: Colors.deepPurpleAccent),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Subject',
                            style: TextStyle(color: Colors.tealAccent),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: _subjectController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            validator: (subject){
                              if(subject!.isNotEmpty && subject.length > 1) {
                                return null;
                              }else {
                                if(subject.isEmpty) {
                                  return 'Todo 제목을 작성해주세요.';
                                }
                                return 'Todo 제목이 너무 짧습니다.';
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 10.0,
                        children: todoColors
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = e[0];
                                    });
                                    print(selectedColor);
                                  },
                                  child: Container(
                                    child: selectedColor == e[0]
                                        ? Opacity(
                                            opacity: 0.3,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey,
                                                ),
                                                width: 40,
                                                height: 40,
                                                child: Icon(Icons.check)))
                                        : SizedBox(),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: e[1]),
                                    width: 40,
                                    height: 40,
                                  ),
                                ))
                            .toList(),
                      ),
                      Spacer(),
                      SizedBox(
                        width: Get.width,
                        child: ElevatedButton(
                            onPressed: () async {
                              if(formKey.currentState!.validate()) {
                                Logger().d('통과');
                                await TodoRepository.addTodo(widget.selectedDate, _subjectController.text, selectedColor);
                                tempListForReturn = await TodoRepository.getTodo(widget.selectedDate);
                                Get.back(result: tempListForReturn);
                              }
                            },
                            child: Container(
                              width: Get.width / 2,
                              child: Text(
                                '추가하기',
                                textAlign: TextAlign.center,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
