import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bynryv1/models/models.dart';

class HomeBody extends StatefulWidget {
  final List<ViewBills> viewBills;
  final List<String> dashNames;
  final List<ImageIcon> dashIcons;
  final Function(ViewBills) onTapBill;
  final Function(int) onTapIcon;

  HomeBody({
    required this.viewBills,
    required this.dashNames,
    required this.dashIcons,
    required this.onTapBill,
    required this.onTapIcon,
  });

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String dropDownVal = 'one';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent[700],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.profile_circled,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Hello \nThomas",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "   Quick Actions",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent[700],
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 200,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.dashNames.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                widget.onTapIcon(index);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Center(
                                      child: widget.dashIcons[index],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(widget.dashNames[index])
                                ],
                              ),
                            );
                          }),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text("Gas",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold)),
                              const Text(
                                " | ",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "SA1234567",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent[700]),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(3, 0, 0, 0),
                              child: DropdownButton<String>(
                                value: dropDownVal,
                                style: const TextStyle(color: Colors.grey),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                ),
                                underline: Container(),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropDownVal = value!;
                                  });
                                },
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: 'one',
                                    child: Text('Last Month'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'two',
                                    child: Text('This Month'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'three',
                                    child: Text('All Past'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: widget.viewBills.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white,
                                elevation: 10,
                                surfaceTintColor: Colors.grey,
                                shadowColor: Colors.grey,
                                child: ListTile(
                                  onTap: () {
                                    widget.onTapBill(widget.viewBills[index]);
                                  },
                                  title: Text(
                                    widget.viewBills[index].billName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Icon(widget.viewBills[index].icon),
                                  subtitle: Text(
                                    widget.viewBills[index].date,
                                    style:
                                    TextStyle(color: Colors.grey[700]),
                                  ),
                                  trailing: Text(
                                      widget.viewBills[index].formattedAmount,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
