import 'package:flutter/material.dart';

class Scaffold extends StatelessWidget {
  const Scaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: Text('appBar는 여기에 고정시키고 indexStack?? 같은 걸로 여기서 map, calendar 페이지 이동시켜줘야겠다.'
          '왜냐면 오른쪽 위의 메뉴바를 틀어야하기 때문이다.. 아니면 2개면 그냥 2번 넣을까? ㅋㅋㅋㅋ 갑자기 그러고 싶은데..?'
          '앱 전반적인 효율은 떨어지지만 내가 편하긴해...ㅎㅎ'),

    ));
  }
}
