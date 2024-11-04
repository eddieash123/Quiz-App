// import 'package:flutter/material.dart';

// class QuestionsSummary extends StatelessWidget {
//   const QuestionsSummary({super.key, required this.summaryData});

//   final List<Map<String, Object>> summaryData;

//   @override
//   Widget build(context) {
//     return SizedBox(
//       height: 400,
//       child: SingleChildScrollView(
//         child: Column(
//           children: summaryData.map((data) {
//             return Row(
//               children: [
//                 Text(((data['question_index'] as int) + 1).toString()),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Text(data['question'] as String,
//                       style:const TextStyle(
//                         color:Colors.white,
//                         fontSize: 24,
//                       ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(data['user_answer'] as String,
//                       style:const TextStyle(
//                         color:Colors.white,
//                         fontSize: 18,
//                       ),),
//                       Text(data['correct_answer'] as String,
//                       style:const TextStyle(
//                         color:Colors.white,
//                         fontSize: 18,
//                       ),),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] == data['correct_answer'];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns number to the top
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0), // Adds space around the text
                    decoration: BoxDecoration(
                      color: isCorrect ? Colors.blue : Colors.red, // Green if correct, red if incorrect // Background color of the circle
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(), // Dynamically show question number
                      style: const TextStyle(
                        color: Colors.white, // Color of the number text
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Spacing between number and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Left-aligns the text
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Your answer: ${data['user_answer']}",
                          style: TextStyle(
                            color: Colors.red[100],
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Correct answer: ${data['correct_answer']}",
                          style: TextStyle(
                            color: Colors.blue[100],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
