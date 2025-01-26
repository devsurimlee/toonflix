import 'package:flutter/material.dart';
import 'package:toonflix/screen/detail_screen.dart';

class WebtoonWidget extends StatelessWidget {
  final String title;
  final String thumb;
  final String id;

  /// 웹툰 썸네일 위젯
  const WebtoonWidget({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return DetailScreen(
                title: title,
                thumb: thumb,
                id: id,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    color: Colors.black54,
                    offset: Offset(10, 10),
                  )
                ],
              ),
              child: Image.network(
                thumb,
                headers: const {
                  'Referer': 'https://comix.naver.com',
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
