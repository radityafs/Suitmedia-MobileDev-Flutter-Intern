import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/components/card_user.dart';
import 'package:suitmedia_flutter/components/custom_app_bar.dart';
import 'package:suitmedia_flutter/models/user_model.dart';
import 'package:suitmedia_flutter/utils/fetchers/user_fetcher.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int currentPage = 1;
  bool isLoading = false;
  bool isLastPage = false;
  bool isError = false;

  final List<User> users = [];
  late ScrollController scrollController;

  Future<void> getUsers() async {
    if (isLoading || isLastPage) return;

    try {
      isLoading = true;

      final UserModel users = await fetchUsers(page: currentPage);

      setState(() {
        currentPage = users.page;
        isLastPage = currentPage == users.totalPages;
        this.users.addAll(users.data);

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  void scrollListener() {
    var nextPageTrigger = 0.9 * scrollController.position.maxScrollExtent;

    if (scrollController.position.pixels >= nextPageTrigger) {
      currentPage++;
      getUsers();
    }
  }

  @override
  void initState() {
    getUsers();

    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Third Screen"),
      body: SafeArea(
        child: Column(
          children: [
            if (users.isEmpty)
              const Center(
                child: CircularProgressIndicator(),
              ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return CardUser(
                    user: users[index],
                    onTap: (user) {
                      Navigator.pop(context, userToJson(user));
                    },
                  );
                },
              ),
            ),
            if (isLoading && users.isNotEmpty)
              const Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            if (isLastPage && users.isNotEmpty)
              const Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text("You've reached the end of the list"),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
