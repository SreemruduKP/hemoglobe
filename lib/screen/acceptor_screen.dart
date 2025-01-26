import 'package:flutter/material.dart';
import 'package:flutteru/screen/role_selection.dart';

class AcceptorScreen extends StatefulWidget {
  const AcceptorScreen({super.key});

  @override
  State<AcceptorScreen> createState() => _AcceptorScreenState();
}

class _AcceptorScreenState extends State<AcceptorScreen> {
  String? selectedBloodGroup;
  DateTime? selectedDate;
  String? selectedLocation;

  // Sample donor data - in a real app, this would come from a database
  final List<Map<String, String>> donors = [
    {
      'name': 'John Doe',
      'bloodGroup': 'O+',
      'location': 'New York',
      'phone': '1234567890',
    },
    {
      'name': 'Jane Smith',
      'bloodGroup': 'A+',
      'location': 'Los Angeles',
      'phone': '0987654321',
    },
  ];

  bool isCompatibleBloodGroup(String recipientGroup, String donorGroup) {
    // Blood group compatibility chart
    final Map<String, List<String>> compatibility = {
      'A+': ['A+', 'A-', 'O+', 'O-'],
      'A-': ['A-', 'O-'],
      'B+': ['B+', 'B-', 'O+', 'O-'],
      'B-': ['B-', 'O-'],
      'AB+': ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
      'AB-': ['A-', 'B-', 'AB-', 'O-'],
      'O+': ['O+', 'O-'],
      'O-': ['O-'],
    };

    return compatibility[recipientGroup]?.contains(donorGroup) ?? false;
  }

  List<Map<String, String>> get filteredDonors {
    return donors.where((donor) {
      if (selectedBloodGroup != null) {
        return isCompatibleBloodGroup(selectedBloodGroup!, donor['bloodGroup']!);
      }
      if (selectedLocation != null) {
        return donor['location'] == selectedLocation;
      }
      return true;
    }).toList();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showRequestDialog(Map<String, String> donor) {
    if (!isCompatibleBloodGroup(selectedBloodGroup ?? 'A+', donor['bloodGroup']!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This donor\'s blood group is not compatible with your requirement.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Send Blood Request'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Donor: ${donor['name']}'),
            Text('Blood Group: ${donor['bloodGroup']}'),
            Text('Location: ${donor['location']}'),
            const SizedBox(height: 16),
            const Text('Would you like to send a blood request to this donor?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Here you would implement the actual request logic
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Request sent successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Send Request'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
          ),
        ),
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
        title: const Text('Find Blood Donors'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red[700]!, Colors.red[500]!],
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.search,
                    size: 48,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Find Blood Donors',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Search for compatible donors near you',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchFilters(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Available Donors',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            selectedBloodGroup = null;
                            selectedLocation = null;
                            selectedDate = null;
                          });
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reset Filters'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildDonorsList(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Implement emergency request
        },
        backgroundColor: Colors.red[700],
        icon: const Icon(Icons.emergency),
        label: const Text('Emergency Request'),
      ),
    );
  }

  Widget _buildSearchFilters() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search Filters',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Blood Group Needed',
                border: OutlineInputBorder(),
              ),
              value: selectedBloodGroup,
              items: const [
                DropdownMenuItem(value: 'A+', child: Text('A+')),
                DropdownMenuItem(value: 'A-', child: Text('A-')),
                DropdownMenuItem(value: 'B+', child: Text('B+')),
                DropdownMenuItem(value: 'B-', child: Text('B-')),
                DropdownMenuItem(value: 'AB+', child: Text('AB+')),
                DropdownMenuItem(value: 'AB-', child: Text('AB-')),
                DropdownMenuItem(value: 'O+', child: Text('O+')),
                DropdownMenuItem(value: 'O-', child: Text('O-')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedBloodGroup = value;
                });
              },
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Required Date',
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  selectedDate?.toString().split(' ')[0] ?? 'Select Date',
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
              value: selectedLocation,
              items: const [
                DropdownMenuItem(value: 'New York', child: Text('New York')),
                DropdownMenuItem(value: 'Los Angeles', child: Text('Los Angeles')),
                DropdownMenuItem(value: 'Chicago', child: Text('Chicago')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedLocation = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonorsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredDonors.length,
      itemBuilder: (context, index) {
        final donor = filteredDonors[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red[50],
              child: Text(
                donor['bloodGroup'] ?? '',
                style: TextStyle(
                  color: Colors.red[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(donor['name'] ?? ''),
            subtitle: Text('📍 ${donor['location']}'),
            trailing: ElevatedButton(
              onPressed: () => _showRequestDialog(donor),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                foregroundColor: Colors.white,
              ),
              child: const Text('Request'),
            ),
          ),
        );
      },
    );
  }
} 