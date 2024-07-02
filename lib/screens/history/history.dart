import 'package:flutter/material.dart';
import 'package:weather/services/history_client.dart';
import 'package:weather/models/history_model.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<SearchHistory> historyList = [];
  History history =  History();

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future _loadHistory() async {
    List<SearchHistory> loadedHistory = await history.loadHistory();
    loadedHistory = loadedHistory.reversed.toList();
    setState(() {
      historyList = loadedHistory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search History'),
        actions: [
          IconButton(onPressed: (){
            history.clearHistory();
            setState(() {
              historyList = [];
            });
          }, icon: Icon(Icons.delete))
        ],
      ),
      body: historyList.length != 0 ?
      ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          SearchHistory historyItem = historyList[index];

          return ListTile(
            title: Text(historyItem.location),
            subtitle: Text('${historyItem.temperature}°C'),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date : ${historyItem.time.toString().substring(0,10)}'),
                Text('Time : ${historyItem.time.toString().substring(11,16)}'),
              ],
            ),
          );
        },
      ) :
          Center(child: Text("Nothing to see here."),)
    );
  }
}
