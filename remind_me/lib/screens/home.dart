import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/models/task_model.dart';

class CardWidget extends StatelessWidget {
  // ... (Constructor and properties remain the same)

  @override
  Widget build(BuildContext context) {
    final colors = [0xff648e9a, 0xFFFF80A6, 0xFF3699EC, 0xff648e9a, 0xFFFFC04E, 0xff8c0335, 0xff103b40, 0xff191A19];
    final minHeight = getMinHeight(index);
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    // Safe access to task properties with null checks
    final title = task.title ?? ""; 
    final content = task.content ?? "";
    final startTime = task.startTime ?? "";
    final repeat = task.repeat ?? "";
    final isCompleted = task.isCompleted == 1;
    
    // Safely get color index
    final colorIndex = int.tryParse(task.color?.toString() ?? '0') ?? 0;
    final cardColor = Color(colors[colorIndex]);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: cardColor,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
                Text(isCompleted ? "COMPLETED" : "TODO", style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              ],
            ),
            SizedBox(height: screenH * 0.005),
            Text(content, style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 15, color: Colors.grey[100]),
            )),
            SizedBox(height: screenH * 0.01), // Added spacing
            Row( 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildIconWithLabel(Icons.access_time_rounded, startTime, screenW),
                _buildDivider(screenW),
                _buildIconWithLabel(Icons.update, repeat, screenW),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildDivider(screenW) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenW * 0.01),
      height: 10,
      width: 1.5,
      color: Colors.grey[200]!.withOpacity(0.7),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label, screenW) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[200], size: 18),
        Container(
          alignment: Alignment.center,
          height: screenH*0.02,
          width: screenW*0.12,
          child: AutoSizeText(
            label,
            minFontSize: 10.0,
            style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 13, color: Colors.grey[100]),
            ),
          ),
        ),
      ],
    );
  }

  // ... (getMinHeight method remains the same)
}
