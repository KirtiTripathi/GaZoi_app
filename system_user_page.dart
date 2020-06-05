import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SystemUserPage extends StatefulWidget {
  @override
  _SystemUserPageState createState() => _SystemUserPageState();
}

class _SystemUserPageState extends State<SystemUserPage> {
  String selectedAdmin;
  String selectedStatus;
  DateTime _Date = DateTime.now();
  var _newDate = "";

  var now = DateTime.now();
  var formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10,
        ),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'System User',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      Image.asset(
                        'assets/filter.png',
                        height: 35,
                        width: 35,
                        color: Colors.blue[700],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 600,
                    child: ListView(
                      children: <Widget>[
                        _getUser(),
                        _getUser(),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.person_add),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getUser() => Padding(
        padding:
            const EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 10.0),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue[700], width: 1.5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    color: Colors.grey[400]),
              ]),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'First Name'),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Last Name'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(labelText: 'Phone Number'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(child: _getAdmin())
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: _getStatus(),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(child: _getCalander())
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blue[700]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            Text(
                              "EDIT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 35,
                        width: 95,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.red[400]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.delete_forever,
                              color: Colors.white,
                            ),
                            Text(
                              "DELETE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget _getAdmin() => DropdownButtonFormField<String>(
        value: selectedAdmin,
        isExpanded: true,
        decoration: InputDecoration(
          hintText: 'Super Admin',
        ),
        onChanged: (SuperAdmin) => setState(() => selectedAdmin = SuperAdmin),
        onSaved: (String val) {
          selectedAdmin = val;
          print(selectedAdmin);
        },
        items: [' Super Admin', 'Admin']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );

  Widget _getStatus() => DropdownButtonFormField<String>(
        value: selectedStatus,
        isExpanded: true,
        decoration: InputDecoration(
          hintText: 'Active',
        ),
        onChanged: (Active) => setState(
          () => selectedStatus = Active,
        ),
        onSaved: (String val) {
          selectedStatus = val;
          print(selectedStatus);
        },
        items: ['Active', 'Inactive']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: value == value
                ? Text(value,
                    style: TextStyle(
                        color: Colors.cyan[600], fontWeight: FontWeight.w700))
                : Text('value', style: TextStyle(color: Colors.black)),
          );
        }).toList(),
      );

  Widget _getCalander() => Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    selectDate(BuildContext, context);
                  },
                  child: Text(
                    'Created Date \n\t${_newDate}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  selectDate(BuildContext, context);
                },
                icon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.blue[700],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 1.5,
            color: Colors.grey,
          )
        ],
      );

  Future<Null> selectDate(BuildContext, context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _Date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _Date) {
      setState(() {
        _Date = picked;
        String dateStr = formatter.format(picked);
        _newDate = dateStr;
        print("Selected Start New Date ${_newDate} ");
      });
    }
  }
}
