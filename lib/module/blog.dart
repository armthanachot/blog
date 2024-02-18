import 'package:flutter/material.dart';
import 'package:myblog/extension/padding.dart';
import 'package:myblog/extension/string.dart';
import 'package:myblog/theme/app_color.dart';
import 'package:myblog/theme/decoration.dart';
import 'package:myblog/widget/screen.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  TextEditingController _postController = TextEditingController();
  bool _showPostBox = false;
  ScrollController _scrollController = ScrollController();
  List<String> _posts = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  Widget buildPostBox() {
    return SizedBox(
      width: ScreenSize.fullW(context),
      child: Column(
        children: [
          TextField(
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'What\'s on your mind?\n\n\n\n\n',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
            controller: _postController,
          ).pCustom(top: 20, bottom: 0, left: 20, right: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                onPressed: () {
                  if (_postController.text.isNotEmpty) {
                    setState(() {
                      _posts.insert(0, _postController.text);
                      _postController.clear();
                      FocusScope.of(context).unfocus(); // Close the keyboard
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.post_add_outlined, color: Colors.white),
                      'Post'.textWithStyle(const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ))
                    ],
                  ),
                )).pt(10),
          ).ph20(),
        ],
      ),
    );
  }

  Widget buildBox(String text) {
    return Container(
      width: ScreenSize.fullW(context),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: text.textWithStyle(const TextStyle(
        fontSize: 16,
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    //postframe callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _showPostBox = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
        backgroundColor: AppColor.orange,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Close the keyboard
        },
        child: SafeArea(
            child: Container(
          decoration: AppDecoration.bg,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_showPostBox) buildPostBox(),
                ..._posts.map((e) => buildBox(e)).toList(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
