import 'package:_12_animated_app/screens/goal_detail_screen.dart';
import 'package:_12_animated_app/widgets/add_goal_bottom.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/goal_card.dart';
import '../models/goal.dart';

class GoalScreen extends StatelessWidget {
  final List<Goal> goals = [
    Goal(
      title: 'Mountain Bike',
      category: 'sport',
      currentAmount: 180,
      goalAmount: 300,
      color: Colors.pink.shade100,
      hashtag: '#sport',
      progressByMonth: [92, 56, 30],
    ),
    Goal(
      title: 'Sony Playstation',
      category: 'game',
      currentAmount: 144,
      goalAmount: 800,
      color: Colors.blue.shade100,
      hashtag: '#game',

      progressByMonth: [55, 69, 100],
    ),
    Goal(
      title: 'Buffy Nature Skateboard',
      category: 'entertainment',
      currentAmount: 240,
      goalAmount: 240,
      color: Colors.yellow.shade100,
      hashtag: '#entertainment',
      progressByMonth: [80, 10, 68],
    ),
  ];

  final double cardHeight = 280.0;
  final double overlap = 100.0;

  GoalScreen({super.key}); // 10% overlap

  @override
  Widget build(BuildContext context) {
    final double totalHeight =
        (goals.length - 1) * (cardHeight - overlap) + cardHeight;

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 28),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text(
                    'Goals',
                    style: TextStyle(
                      fontSize: 35,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'LuckiestGuy',
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.add, size: 28),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.6,
                            minChildSize: 0.4,
                            maxChildSize: 0.9,
                            builder: (
                              BuildContext context,
                              ScrollController scrollController,
                            ) {
                              return AddGoalBottomSheet();
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Lottie.asset(
                  'assets/Lottie/cat.json',
                  height: 160,
                  width: 230,
                  repeat: true,
                  reverse: true,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: totalHeight,
                  child: Stack(
                    children:
                        goals.asMap().entries.map((entry) {
                          int index = entry.key;
                          Goal goal = entry.value;

                          // double scale = 1.0 - (index * 0.03);
                          double scale = 1;

                          // double scale = 1.0 - (index * index * 0.01);
                          // double scale = 1 - (index / goals.length * 0.1);
                          return Positioned(
                            top: index * (cardHeight - overlap),
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              width:
                                  MediaQuery.of(context).size.width *
                                  1, // Fixed width for all cards
                              child: Transform(
                                alignment: Alignment.topCenter,
                                transform:
                                    Matrix4.identity()
                                      ..scale(scale, scale)
                                      ..setEntry(3, 2, 0.004) // Perspective
                                      ..rotateX(
                                        0.1,
                                      ), // Subtle rotation for perspective
                                child: GestureDetector(
                                  onTap: () {
                                    RenderBox box =
                                        context.findRenderObject() as RenderBox;
                                    Offset position = box.localToGlobal(
                                      Offset.zero,
                                    );
                                    final Size size = box.size;
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        transitionDuration: const Duration(
                                          milliseconds: 600,
                                        ),
                                        pageBuilder:
                                            (_, __, ___) => GoalDetailScreen(
                                              goal: goal,
                                              cardOffset: position,
                                              cardSize: size,
                                            ),
                                        opaque: false,
                                      ),
                                    );
                                  },
                                  // child: Container(
                                  //   decoration: BoxDecoration(
                                  //     color: goal.color,
                                  //     borderRadius: BorderRadius.circular(
                                  //       20,
                                  //     ), // Rounded corners
                                  //     // boxShadow: [
                                  //     //   BoxShadow(
                                  //     //     color: Colors.black.withOpacity(0.1),
                                  //     //     blurRadius: 10,
                                  //     //     offset: Offset(
                                  //     //       0,
                                  //     //       5,
                                  //     //     ), // Subtle shadow for depth
                                  //     //   ),
                                  //     // ],
                                  //   ),
                                  child: GoalCard(
                                    goal: goal,
                                  ), // Your custom GoalCard widget
                                ),
                              ),
                            ),
                          );
                          // return Positioned(
                          //   top: index * (cardHeight - overlap),
                          //   left: 0,
                          //   right: 0,
                          //   child: SizedBox(
                          //     width:
                          //         MediaQuery.of(context).size.width *
                          //         1, // Fixed width for all cards
                          //     child: Transform(
                          //       alignment: Alignment.topCenter,
                          //       transform:
                          //           Matrix4.identity()..scale(
                          //             scale,
                          //             scale,
                          //           ), // Only scaling remains
                          //       child: GestureDetector(
                          //         onTap: () {
                          //           RenderBox box =
                          //               context.findRenderObject() as RenderBox;
                          //           Offset position = box.localToGlobal(
                          //             Offset.zero,
                          //           );
                          //           final Size size = box.size;
                          //           Navigator.of(context).push(
                          //             PageRouteBuilder(
                          //               transitionDuration: const Duration(
                          //                 milliseconds: 600,
                          //               ),
                          //               pageBuilder:
                          //                   (_, __, ___) => GoalDetailScreen(
                          //                     goal: goal,
                          //                     cardOffset: position,
                          //                     cardSize: size,
                          //                   ),
                          //               opaque: false,
                          //             ),
                          //           );
                          //         },
                          //         child: GoalCard(
                          //           goal: goal,
                          //         ), // Your custom GoalCard widget
                          //       ),
                          //     ),
                          //   ),
                          // );
                        }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
