import 'package:flutter/material.dart';
import 'tabs/chats_tab.dart';
import 'tabs/status_tab.dart';
import 'tabs/calls_tab.dart';
import 'settings_screen.dart';
import 'search_screen.dart';
import 'group_create_screen.dart';
import 'tabs/groups_tab.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState()=>_HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return DefaultTabController(length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Alanya'),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const SearchScreen()),
                );
              }, icon: const Icon(Icons.search)
              ),
              PopupMenuButton<String>(
                onSelected: (value){
                  switch(value){
                    case 'Settings':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsScreen()),
                      );
                      break;
                    case 'New group':
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>const GroupCreateScreen())
                      );


                  }
                },
                itemBuilder: (context)=>[
                    const PopupMenuItem(value: 'New group', child: Text('Nouveau groupe')),
                    const PopupMenuItem(value: 'Settings', child: Text('Paramètres')),
                ],
              ),
            ],
             bottom: const TabBar(
               indicatorColor: Colors.white,
               tabs: [
                 Tab(text: 'Discussions'),
                 Tab(text: 'Groups'),
                 Tab(text: 'Status'),
                 Tab(text: 'Appels'),
               ],
             ),
          ),
          body: const TabBarView(
            children: [
              ChatsTab(),
              GroupsTab(),
              StatusTab(),
              CallsTab(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: ()=>{
                print("Action pour nouveau message a implementer dans home_screen ligne 81")
              },
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child:const Icon(Icons.message,color: Colors.white),
          ),
        ),
    );
  }

}