import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final Task? task;
  TaskCard(this.task);

  @override
  Widget build(BuildContext context) {
    final title = task?.title ?? "";
    final content = task?.content ?? "";
    final startTime = task?.startTime ?? "";
    final date = task?.date ?? "";
    final isCompleted = task?.isCompleted == 1;
    final bgColor = _getBGClr(task?.color ?? 0);
    final textColor = bgColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    return Card( // Use Card widget for a subtle elevation and rounded corners
      margin: EdgeInsets.symmetric(vertical: 8.0), // Increased margin for better spacing
      elevation: 2, // Add subtle elevation
      shape: RoundedRectangleBorder( // Customize the shape of the card
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: bgColor, width: 1.5), // Add a colored border
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 18, // Slightly increased font size for title
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                )),
                SizedBox(height: 10),
                Text(content, style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 14, color: textColor),
                )),
                SizedBox(height: 12),
                _buildTimeAndDateRow(startTime, date, textColor), 
              ],
            ),
          ),
          _buildVerticalDivider(textColor),       
          _buildRotatedStatusText(isCompleted, bgColor),
        ]),
      ),
    );
  }

  // ... (Other extracted methods)

  Widget _buildTimeAndDateRow(String startTime, String date, Color textColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.access_time_rounded, color: textColor, size: 18),
        SizedBox(width: 4),
        Text(startTime, style: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 13, color: textColor),
        )),
        _buildHorizontalDivider(textColor), 
        Icon(Icons.calendar_today_outlined, color: textColor, size: 16),
        Text(date, style: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 13, color: textColor),
        )),
      ],
    );
  }

  // ... (Other methods adapted to use textColor parameter)

  _getBGClr(int no) { 
    // ... (The same logic for getting background color)
  }
}
