import 'package:flutter/material.dart';
import 'package:github_api_demo/api/github_api.dart';
import 'package:github_api_demo/pages/following_page.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              const SizedBox(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('images/github-icon.jpg'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Github",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.1)),
                child: TextField(
                  onChanged: (value) {},
                  controller: _controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    errorText: errorMessage,
                    border: InputBorder.none,
                    hintText: "Github username",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding: const EdgeInsets.all(20),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Align(
                  child: isLoading
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2,
                        )
                      : const Text(
                          'Get Your Following Now',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final username = _controller.text;
                  final api = GithubApi();
                  final user = await api.findUser(username);
                  if (user == null) {
                    setState(() {
                      isLoading = false;
                      errorMessage = "Usuario não encontrado";
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                      errorMessage = null;
                      _controller.text = "";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                FollowingPage(user)));
                  }
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
