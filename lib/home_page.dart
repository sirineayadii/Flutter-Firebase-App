import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/add_new_task.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/widgets/date_selector.dart';
import 'package:frontend/widgets/task_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<QuerySnapshot> tasksFuture;

  @override
  void initState() {
    super.initState();
    tasksFuture = FirebaseFirestore.instance.collection('tasks').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewTask(),
                ),
              ).then((_) {
                /// refresh tasks after adding
                setState(() {
                  tasksFuture =
                      FirebaseFirestore.instance.collection('tasks').get();
                });
              });
            },
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const DateSelector(),
          Expanded(
            child: FutureBuilder<QuerySnapshot>(
              future: tasksFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      "Error loading tasks",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      "No tasks yet",
                      style: TextStyle(fontSize: 17),
                    ),
                  );
                }

                final tasks = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: tasks.length,
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                    final task = tasks[index].data() as Map<String, dynamic>;

                    final header = task['title'] ?? 'No Title';
                    final description = task['description'] ?? 'No Description';
                    final date = task['date'] ?? 'Unknown date';
                    final time = task['time'] ?? 'Time?';
                    final colorCode = task['color'] ?? 0xFFF6DEC2;

                    final cardColor = Color(colorCode);

                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TaskCard(
                              color: cardColor,
                              headerText: header,
                              descriptionText: description,
                              scheduledDate: date,
                            ),
                          ),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: strengthenColor(cardColor, 0.65),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              time,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
