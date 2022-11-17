import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rest_api_users/api/api_service.dart';
import 'package:rest_api_users/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<User>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    //_userModel = (await ApiService.getUsers())!;
    _userModel = await ApiService().getUsers();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetching Users Data'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _userModel![index].id.toString() + " - ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(_userModel![index].username + ", ",
                              style: TextStyle(fontSize: 18)),
                          Text(_userModel![index].email + ", "),
                          Text(
                            _userModel![index].website,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            _userModel![index].phone,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
