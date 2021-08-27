import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';

class IncomePage extends StatefulWidget {
  // const IncomePage({ key }) : super(key: key);
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: cBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Momentumicon.arrow_left,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Lokasi Cabang",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Momentumicon.location,
                            color: Colors.white,
                            size: 14,
                          ),
                          Text(
                            "Surabaya - Jl Kalibokor tim ...",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
//   }
//   BarChartGroupData makeGroupData(
//     int x,
//     double y, {
//     bool isTouched = false,
//     Color barColor = Colors.white,
//     double width = 22,
//     List<int> showTooltips = const [],
//   }) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           y: isTouched ? y + 1 : y,
//           colors: isTouched ? [Colors.yellow] : [barColor],
//           width: width,
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             y: 20,
//             colors: [barBackgroundColor],
//           ),
//         ),
//       ],
//       showingTooltipIndicators: showTooltips,
//     );
//   }

//   List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
//         switch (i) {
//           case 0:
//             return makeGroupData(0, 5, isTouched: i == touchedIndex);
//           case 1:
//             return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
//           case 2:
//             return makeGroupData(2, 5, isTouched: i == touchedIndex);
//           case 3:
//             return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
//           case 4:
//             return makeGroupData(4, 9, isTouched: i == touchedIndex);
//           case 5:
//             return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
//           case 6:
//             return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
//           default:
//             return throw Error();
//         }
//       });



//   BarChartData randomData() {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         enabled: false,
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (value) =>
//               const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
//           margin: 16,
//           getTitles: (double value) {
//             switch (value.toInt()) {
//               case 0:
//                 return 'M';
//               case 1:
//                 return 'T';
//               case 2:
//                 return 'W';
//               case 3:
//                 return 'T';
//               case 4:
//                 return 'F';
//               case 5:
//                 return 'S';
//               case 6:
//                 return 'S';
//               default:
//                 return '';
//             }
//           },
//         ),
//         leftTitles: SideTitles(
//           showTitles: false,
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       barGroups: List.generate(7, (i) {
//         switch (i) {
//           case 0:
//             return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
//           case 1:
//             return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
//           case 2:
//             return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
//           case 3:
//             return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
//           case 4:
//             return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
//           case 5:
//             return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
//           case 6:
//             return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
//           default:
//             return throw Error();
//         }
//       }),
//     );
//   }

//   Future<dynamic> refreshState() async {
//     setState(() {});
//     await Future<dynamic>.delayed(animDuration + const Duration(milliseconds: 50));
//     if (isPlaying) {
//       await refreshState();
//     }
  }
}

