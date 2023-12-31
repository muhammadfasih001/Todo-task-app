import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constant/colors.dart';

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  TextEditingController addItemController = TextEditingController();
  TextEditingController updateTodoItemController = TextEditingController();

  List<String> todoItemList = [];

  addItem() {
    String newItem = addItemController.text;
    if (newItem.isNotEmpty) {
      setState(
        () {
          todoItemList.add(newItem);
          addItemController.clear();
        },
      );
    }
  }

  removeItem(int index) {
    setState(() {
      todoItemList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: tdBgColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "images/todopic.png",
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              textAlign: TextAlign.center,
              "Muhammad Fasih",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const ListTile(
              leading: Icon(
                Icons.add,
                size: 35,
                color: Colors.blue,
              ),
              title: Text(
                "Add new task",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ListTile(
              leading: Icon(
                Icons.delete_outline,
                size: 35,
                color: Colors.blue,
              ),
              title: Text(
                "Delete all tasks",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ListTile(
              leading: Icon(
                Icons.edit_note,
                size: 35,
                color: Colors.blue,
              ),
              title: Text(
                "Edit tasks",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ListTile(
              leading: Icon(
                Icons.edit,
                size: 29,
                color: Colors.blue,
              ),
              title: Text(
                "Edit proile",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ListTile(
              leading: Icon(
                Icons.contact_support_outlined,
                size: 29,
                color: Colors.blue,
              ),
              title: Text(
                "Support",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ListTile(
              leading: Icon(
                Icons.exit_to_app_outlined,
                size: 35,
                color: Colors.blue,
              ),
              title: Text(
                "Exit",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: tdBgColor),
        centerTitle: true,
        elevation: 0,
        backgroundColor: tdBgColor,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu_open,
                color: Colors.blue,
              ),
            );
          },
        ),
        title: const Text(
          "Todo App",
          style: TextStyle(color: Colors.blue, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: addItemController,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: "Add a new todo item.....",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: Colors.blue,
                fixedSize: const Size(100, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                addItem();
              },
              child: const Icon(
                Icons.add,
                size: 35,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: todoItemList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 55,
                      width: 350,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 5),
                      padding: const EdgeInsets.only(left: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            todoItemList[index],
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  updateTodoItemController.text =
                                      todoItemList[index];
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        title: const Row(
                                          children: [],
                                        ),
                                        content: TextField(
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          controller: updateTodoItemController,
                                          decoration: const InputDecoration(
                                            label: Text(
                                              "Update Item",
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.grey,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(90, 40),
                                              backgroundColor: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Cancle",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              fixedSize: const Size(90, 40),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                todoItemList[index] =
                                                    updateTodoItemController
                                                        .text;
                                              });
                                              updateTodoItemController.clear();
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Update",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.update),
                                iconSize: 30,
                                color: Colors.white,
                              ),
                              IconButton(
                                onPressed: () {
                                  removeItem(index);
                                },
                                icon: const Icon(Icons.delete),
                                iconSize: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
