// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: [
            const Icon(Icons.arrow_back),
            const SizedBox(width: 16),
            const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              minRadius: 48 / 2,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dr. Amal AL Nahadi',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4bf50d),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'online',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.video_call),
            const SizedBox(width: 24),
            const Icon(Icons.call),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: 4 + 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ChatBox(isSender: index % 2 == 0),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 92,
              decoration: BoxDecoration(color: Colors.grey[50]),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(2),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        Text('Type Something...'),
                        Spacer(),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topRight: Radius.circular(2),
                              bottomLeft: Radius.circular(2),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatBox extends StatelessWidget {
  final bool isSender;

  const ChatBox({Key? key, required this.isSender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxHeight: 200, minHeight: 56, minWidth: 162, maxWidth: MediaQuery.of(context).size.width * 0.8),
        decoration: BoxDecoration(
            color: Color(isSender ? 0xFFedf3ff : 0xFFefefef),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(13),
              topRight: const Radius.circular(13),
              bottomLeft: !isSender ? const Radius.circular(13) : Radius.zero,
              bottomRight: isSender ? const Radius.circular(13) : Radius.zero,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.13),
                offset: Offset(0.0, 3),
                blurRadius: 6.0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  'Iste placeat ducimus consequatur delectus iusto quod. Perferendis et eaque minima quas excepturi est tempora corrupti hic. Sunt et voluptatem consequatur illo debitis magni vel nihil quos. Dolorem voluptatem tenetur. Ut distinctio aut. Enim est ullam et repellendus est porro voluptatem natus dolor. Iste placeat ducimus consequatur delectus iusto quod. Perferendis et eaque minima quas excepturi est tempora corrupti hic. Sunt et voluptatem consequatur illo debitis magni vel nihil quos. Dolorem voluptatem tenetur. Ut distinctio aut. Enim est ullam et repellendus est porro voluptatem natus dolor. xx',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 10,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '5 minutes ago',
                style: TextStyle(fontSize: 12, color: Color(0XFF8b8686)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
