import 'package:flutter/material.dart';

class FollowingPage extends StatefulWidget {
  final String login;
  final String avatarUrl;

  const FollowingPage({Key? key, required this.login, required this.avatarUrl}) : super(key: key);

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Following"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(widget.avatarUrl)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.login,
                  style: const TextStyle(fontSize: 22),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            // Lista de usuários seguindo
            child: Container(),
          ),
        ]),
      ),
    );
  }
}
