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
  final List<Map<String, String>> _posts = [
    {
      "content": "A",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_A_red-512.png"
    },
    {
      "content": "B",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_B_red-512.png"
    },
    {
      "content": "C",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_C_red-512.png"
    },
    {
      "content": "D",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_D_red-512.png"
    },
    {
      "content": "E",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_E_red-512.png"
    },
    {
      "content": "F",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_F_red-512.png"
    },
    {
      "content": "G",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_G_red-512.png"
    },
    {
      "content": "H",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_H_red-512.png"
    },
    {
      "content": "I",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_I_red-512.png"
    },
    {
      "content": "J",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_J_red-512.png"
    },
    {
      "content": "K",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_K_red-512.png"
    },
    {
      "content": "L",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_L_red-512.png"
    },
    {"content": "M", "image": ""},
    {"content": "N", "image": ""},
    {"content": "O", "image": ""},
    {"content": "P", "image": ""},
    {"content": "Q", "image": ""},
    {"content": "R", "image": ""},
    {"content": "S", "image": ""},
    {"content": "T", "image": ""},
    {"content": "U", "image": ""},
    {"content": "V", "image": ""},
    {"content": "W", "image": ""},
    {"content": "X", "image": ""},
    {"content": "Y", "image": ""},
    {
      "content": "Z",
      "image":
          "https://cdn3.iconfinder.com/data/icons/letters-and-numbers-1/32/letter_Z_red-512.png"
    },
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
                      _posts.insert(
                          0, {"content": _postController.text, "image": ""});
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

  Widget buildBlog(Map<String, String> post) {
    return Container(
      width: ScreenSize.fullW(context),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
                  post["image"]!.isNotEmpty &&
                  post["image"] != ""
              ? Image.network(post["image"] ?? "",
                  width: 100, height: 100, fit: BoxFit.cover)
              : Container(),
          Text(
            post["content"] ?? "",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
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
                ..._posts.map((e) => buildBlog(e)).toList(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
