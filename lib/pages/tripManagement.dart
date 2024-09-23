import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TripManagementPage extends StatefulWidget {
  @override
  _TripManagementPageState createState() => _TripManagementPageState();
}

class _TripManagementPageState extends State<TripManagementPage> {
  final _formKey = GlobalKey<FormState>();
  String _tripName = '';
  String _destination = '';
  double _budget = 0;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isGroupTrip = false;
  String _groupMembers = '';
  String? _currentTripId; // To hold the current trip ID being edited

  final String? userId = FirebaseAuth.instance.currentUser?.uid;
  List<Map<String, dynamic>> trips = [];
  bool _showAddTripForm = false;

  @override
  void initState() {
    super.initState();
    _fetchTrips();
  }

  Future<void> _fetchTrips() async {
    if (userId != null) {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('trips')
          .where('userId', isEqualTo: userId)
          .get();

      trips = snapshot.docs.map((doc) {
        final data =
            doc.data() as Map<String, dynamic>; // Cast to Map<String, dynamic>
        return {...data, 'id': doc.id}; // Use spread operator to add the 'id'
      }).toList();

      setState(() {});
    }
  }

  Future<void> _updateTrip() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (userId != null && _currentTripId != null) {
        await FirebaseFirestore.instance
            .collection('trips')
            .doc(_currentTripId)
            .update({
          'tripName': _tripName,
          'destination': _destination,
          'budget': _budget,
          'startDate': _startDate,
          'endDate': _endDate,
          'isGroupTrip': _isGroupTrip,
          'groupMembers': _isGroupTrip ? _groupMembers : null,
        });
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );

// Dismiss the dialog after 3 seconds
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(); // Close the dialog
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Trip updated successfully!')),
        );
        _formKey.currentState!.reset();
        _fetchTrips();
        setState(() {
          _showAddTripForm = false; // Hide the form after updating
          _currentTripId = null; // Clear current trip ID
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: User not logged in!')),
        );
      }
    }
  }

  Future<void> _addTrip() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (userId != null) {
        await FirebaseFirestore.instance.collection('trips').add({
          'userId': userId,
          'tripName': _tripName,
          'destination': _destination,
          'budget': _budget,
          'startDate': _startDate,
          'endDate': _endDate,
          'isGroupTrip': _isGroupTrip,
          'groupMembers': _isGroupTrip ? _groupMembers : null,
          'createdAt': Timestamp.now(),
        });
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );

// Dismiss the dialog after 3 seconds
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(); // Close the dialog
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Trip added successfully!')),
        );
        _formKey.currentState!.reset();
        _fetchTrips();
        setState(() {
          _showAddTripForm = false; // Hide the form after adding
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: User not logged in!')),
        );
      }
    }
  }

  Future<void> _deleteTrip(String tripId) async {
    await FirebaseFirestore.instance.collection('trips').doc(tripId).delete();
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

// Dismiss the dialog after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop(); // Close the dialog
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Trip deleted successfully!')),
    );
    _fetchTrips();
  }

  void _editTrip(Map<String, dynamic> trip) {
    setState(() {
      _tripName = trip['tripName'];
      _destination = trip['destination'];
      _budget = trip['budget'];
      _startDate =
          trip['startDate'] != null ? trip['startDate'].toDate() : null;
      _endDate = trip['endDate'] != null ? trip['endDate'].toDate() : null;
      _isGroupTrip = trip['isGroupTrip'];
      _groupMembers = trip['groupMembers'] ?? '';
      _currentTripId = trip['id'];
      _showAddTripForm = true; // Show form for editing
    });
  }

  static const Color primary = Color(0xFF326BFB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: "Trip Management".text.color(Colors.white).make(),
        backgroundColor: primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            if (_showAddTripForm) _buildAddTripForm(),
            if (trips.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: trips.length,
                  itemBuilder: (context, index) {
                    final trip = trips[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      color: Color(0xFF326BFB), // Set card color
                      elevation: 4, // Add shadow for depth
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            16.0), // Padding inside the card
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trip['tripName'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20, // Increased font size for title
                                color: Colors.white, // Title text color
                              ),
                            ),
                            SizedBox(
                                height: 8), // Space between title and subtitle
                            Text(
                              'Destination: ${trip['destination']}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16), // Subtitle text color and size
                            ),
                            Text(
                              'Budget: ${trip['budget']}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'Start Date: ${trip['startDate'] != null ? trip['startDate'].toDate() : 'Not set'}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'End Date: ${trip['endDate'] != null ? trip['endDate'].toDate() : 'Not set'}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            if (trip['isGroupTrip'])
                              Text(
                                'Group Members: ${trip['groupMembers']}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            SizedBox(height: 16), // Space before buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .end, // Align buttons to the right
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.white),
                                  onPressed: () => _editTrip(trip),
                                  tooltip:
                                      'Edit Trip', // Tooltip for accessibility
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.white),
                                  onPressed: () => _deleteTrip(trip['id']),
                                  tooltip:
                                      'Delete Trip', // Tooltip for accessibility
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            if (trips.isEmpty && !_showAddTripForm)
              Center(
                child: Text('No trips found', style: TextStyle(fontSize: 20)),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showAddTripForm = !_showAddTripForm; // Toggle the form visibility
          });
        },
        backgroundColor: primary,
        child: Icon(_showAddTripForm ? Icons.close : Icons.add),
      ),
    );
  }

  Widget _buildAddTripForm() {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Trip Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the trip name';
              }
              return null;
            },
            onSaved: (value) {
              _tripName = value!;
            },
            initialValue: _tripName, // Set initial value for editing
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Destination'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the destination';
              }
              return null;
            },
            onSaved: (value) {
              _destination = value!;
            },
            initialValue: _destination, // Set initial value for editing
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Budget(USD)'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the budget';
              }
              return null;
            },
            onSaved: (value) {
              _budget = double.parse(value!);
            },
            initialValue: _budget.toString(), // Set initial value for editing
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _startDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _startDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                    _startDate == null
                        ? 'Select Start Date'
                        : _startDate.toString().split(' ')[0],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _endDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _endDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                    _endDate == null
                        ? 'Select End Date'
                        : _endDate.toString().split(' ')[0],
                  ),
                ),
              ),
            ],
          ),
          SwitchListTile(
            title: Text('Is this a group trip?'),
            value: _isGroupTrip,
            onChanged: (bool value) {
              setState(() {
                _isGroupTrip = value;
                if (!value) _groupMembers = '';
              });
            },
          ),
          if (_isGroupTrip)
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Group Members (comma-separated)'),
              onSaved: (value) {
                _groupMembers = value!;
              },
              initialValue: _groupMembers, // Set initial value for editing
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _currentTripId != null
                ? _updateTrip
                : _addTrip, // Decide which function to call
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
            ),
            child: (_currentTripId != null ? "Update Trip" : "Add Trip")
                .text
                .color(Colors.white)
                .size(20)
                .fontWeight(FontWeight.bold)
                .make(),
          ),
        ],
      ),
    );
  }
}
