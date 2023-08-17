import 'package:flutter/material.dart';
import 'package:flutter_ui_practice/widgets/dateText.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // default black
    const Color black = Color.fromRGBO(31, 31, 31, 1);

    return const MaterialApp(
      home: Scaffold(
        backgroundColor: black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Header(),
                SizedBox(
                  height: 30,
                ),
                DateArea(),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CardView(
                      title: 'DESIGN\nMEETING',
                      startTime: '11',
                      startMin: '30',
                      endTime: '12',
                      endMin: '20',
                      participantsList: ['ALEX', 'HELENA', 'NANA'],
                      color: Color.fromRGBO(255, 248, 76, 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardView(
                      title: 'DAILY\nPROJECT',
                      startTime: '12',
                      startMin: '35',
                      endTime: '14',
                      endMin: '10',
                      participantsList: ['ME', 'RICHARD', 'CIRY', '+4'],
                      color: Color.fromRGBO(148, 118, 209, 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardView(
                      title: 'WEEKLY\nPLANNING',
                      startTime: '15',
                      startMin: '00',
                      endTime: '16',
                      endMin: '30',
                      participantsList: ['DEN', 'NANA', 'MARK'],
                      color: Color.fromRGBO(187, 224, 70, 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
* 헤더
* */
class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const ClipOval(
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(
                'https://images.unsplash.com/photo-1559825481-12a05cc00344?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8JUVCJUIwJTk0JUVCJThCJUE0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
              ),
            ),
          ),
        ),
        const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        )
      ],
    );
  }
}

/*
* 날짜영역
* */
class DateArea extends StatelessWidget {
  const DateArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MONDAY 16',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'TODAY',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.circle,
                    color: Color.fromRGBO(178, 37, 128, 1),
                    size: 10,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  for (var i = 17; i <= 31; i++) DateText(dateText: '$i'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
* 참석자 리스트
* */
class Participants extends StatelessWidget {
  final String name;

  const Participants({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 14,
            color: name == 'ME'
                ? const Color.fromRGBO(33, 31, 17, 1)
                : const Color.fromRGBO(33, 31, 17, 0.4),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

/*
* 카드뷰
* */
class CardView extends StatelessWidget {
  final String title;
  final String startTime;
  final String startMin;
  final String endTime;
  final String endMin;
  final List<String> participantsList;
  final Color color;

  const CardView(
      {super.key,
      required this.title,
      required this.startTime,
      required this.startMin,
      required this.endTime,
      required this.endMin,
      required this.participantsList,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(45),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      startTime,
                      style: const TextStyle(
                        color: Color.fromRGBO(33, 31, 17, 1),
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      startMin,
                      style: const TextStyle(
                        color: Color.fromRGBO(33, 31, 17, 1),
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      '|',
                      style: TextStyle(
                        color: Color.fromRGBO(33, 31, 17, 1),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      endTime,
                      style: const TextStyle(
                        color: Color.fromRGBO(33, 31, 17, 1),
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      endMin,
                      style: const TextStyle(
                        color: Color.fromRGBO(33, 31, 17, 1),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Transform.translate(
              offset: const Offset(40, 0),
              child: Row(
                children: [
                  for (var i = 0; i < participantsList.length; i++)
                    Participants(
                      name: participantsList[i],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
