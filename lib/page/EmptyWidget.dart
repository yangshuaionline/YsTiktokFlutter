
import 'package:flutter/material.dart';

class EmptyWidget extends StatefulWidget{
  final String error;
  const EmptyWidget({super.key,required this.error});

  @override
  State<StatefulWidget> createState() {
    return _EmptyState();
  }
}
class _EmptyState extends State<EmptyWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提示'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // 返回上一页
        ),
      ),
      body: Center(
        child: Text(widget.error),
      ),
    );
  }
}