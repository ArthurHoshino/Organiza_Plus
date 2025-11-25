import 'package:flutter/material.dart';
import 'cores.dart';

class TaskCard extends StatelessWidget {
  final String nomeTarefa;
  final bool statusTarefa;
  Function(bool?)? onChanged;
  void Function()? onDeleted;
  void Function()? onEdited;

  TaskCard({
    super.key,
    required this.nomeTarefa,
    required this.statusTarefa,
    required this.onChanged,
    required this.onDeleted,
    required this.onEdited,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Cores.corTarefa,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Checkbox(
                value: statusTarefa,
                onChanged: onChanged
            ),
            // const SizedBox(width: 8,),
            Expanded(
              child: Text(
                nomeTarefa,
                style: TextStyle(
                  decoration: statusTarefa
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
            // const SizedBox(width: 8,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.grey),
                  onPressed: onDeleted,
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blueAccent),
                  onPressed: onEdited,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
