import 'package:flutter/material.dart';
import 'package:flutteru/screen/role_selection.dart';



class DonorScreen extends StatefulWidget {

  const DonorScreen({super.key});



  @override

  State<DonorScreen> createState() => _DonorScreenState();

}



class _DonorScreenState extends State<DonorScreen> {

  // Sample donor data - in a real app, this would come from a database
  final List<Map<String, String>> donorsList = [
    {
      'name': 'John Doe',
      'bloodGroup': 'A-',
      'age': '25',
      'weight': '70',
      'address': '123 Main St',
      'phone': '1234567890',
      'lastDonation': '2024-01-01',
    },
    {
      'name': 'Sarah Smith',
      'bloodGroup': 'A+',
      'age': '30',
      'weight': '65',
      'address': '456 Oak Ave',
      'phone': '2345678901',
      'lastDonation': '2024-02-15',
    },
    {
      'name': 'Mike Johnson',
      'bloodGroup': 'O-',
      'age': '28',
      'weight': '80',
      'address': '789 Pine Rd',
      'phone': '3456789012',
      'lastDonation': '2024-01-20',
    },
    {
      'name': 'Emily Brown',
      'bloodGroup': 'B+',
      'age': '32',
      'weight': '62',
      'address': '321 Elm St',
      'phone': '4567890123',
      'lastDonation': '2024-02-01',
    },
    {
      'name': 'David Wilson',
      'bloodGroup': 'AB+',
      'age': '35',
      'weight': '75',
      'address': '654 Maple Dr',
      'phone': '5678901234',
      'lastDonation': '2024-03-01',
    }
  ];



  bool _showDonationHistory = false;



  void _showEditDialog() {

    showDialog(

      context: context,

      builder: (context) => AlertDialog(

        title: const Text('Edit Information'),

        content: SingleChildScrollView(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: donorsList.first.entries.map((entry) {

              return Padding(

                padding: const EdgeInsets.symmetric(vertical: 8.0),

                child: TextField(

                  decoration: InputDecoration(

                    labelText: entry.key,

                    border: const OutlineInputBorder(),

                  ),

                  controller: TextEditingController(text: entry.value),

                  onChanged: (value) {

                    donorsList.first[entry.key] = value;

                  },

                ),

              );

            }).toList(),

          ),

        ),

        actions: [

          TextButton(

            onPressed: () => Navigator.pop(context),

            child: const Text('Cancel'),

          ),

          TextButton(

            onPressed: () {

              setState(() {});

              Navigator.pop(context);

            },

            child: const Text('Save'),

          ),

        ],

      ),

    );

  }



  void _showNotificationAlert() {
    // Filter donors to match exact blood type (A+ with A+, A- with A-, etc.)
    final List<Map<String, String>> compatibleDonors = donorsList.where((donor) {
      String bloodGroup = donor['bloodGroup']!;
      // Match exact blood type only
      return bloodGroup == 'A-';  // Looking for A- donors only
    }).toList();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Compatible Donors'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: compatibleDonors.map((donor) {
              return Column(
                children: [
                  _buildRequestItem(
                    name: donor['name']!,
                    bloodGroup: donor['bloodGroup']!,
                    location: donor['address']!,
                    urgency: 'Normal',
                    date: DateTime.now().toString().substring(0, 10),
                  ),
                  if (donor != compatibleDonors.last) const Divider(),
                ],
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
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

        title: const Text('Donor Dashboard'),

        actions: [

          IconButton(

            icon: const Icon(Icons.notifications),

            onPressed: _showNotificationAlert,

          ),

        ],

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

                  CircleAvatar(

                    radius: 40,

                    backgroundColor: Colors.white,

                    child: Icon(

                      Icons.person,

                      size: 40,

                      color: Colors.red[700],

                    ),

                  ),

                  const SizedBox(height: 16),

                  Text(

                    donorsList.first['name'] ?? '',

                    style: const TextStyle(

                      fontSize: 24,

                      fontWeight: FontWeight.bold,

                      color: Colors.white,

                    ),

                  ),

                  Text(

                    'Blood Group: ${donorsList.first['bloodGroup']}',

                    style: const TextStyle(

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

                  const Text(

                    'Quick Actions',

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height: 16),

                  Row(

                    children: [

                      Expanded(

                        child: _buildActionCard(

                          icon: Icons.edit,

                          title: 'Edit Profile',

                          color: Colors.red[50]!,

                          onTap: _showEditDialog,

                        ),

                      ),

                      const SizedBox(width: 16),

                      Expanded(

                        child: _buildActionCard(

                          icon: Icons.history,

                          title: 'Donation History',

                          color: Colors.red[100]!,

                          onTap: () {

                            setState(() {

                              _showDonationHistory = !_showDonationHistory;

                            });

                          },

                        ),

                      ),

                    ],

                  ),

                  const SizedBox(height: 24),

                  const Text(

                    'Your Information',

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height: 16),

                  _buildInfoCard(),

                  if (_showDonationHistory) ...[

                    const SizedBox(height: 24),

                    _buildDonationHistory(),

                  ],

                  const SizedBox(height: 24),

                  _buildRewardPoints(),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }



  Widget _buildActionCard({

    required IconData icon,

    required String title,

    required Color color,

    required VoidCallback onTap,

  }) {

    return Card(

      elevation: 4,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: InkWell(

        onTap: onTap,

        borderRadius: BorderRadius.circular(16),

        child: Container(

          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(

            color: color,

            borderRadius: BorderRadius.circular(16),

          ),

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              Icon(icon, color: Colors.red[700], size: 32),

              const SizedBox(height: 8),

              Text(

                title,

                style: TextStyle(

                  fontSize: 16,

                  fontWeight: FontWeight.bold,

                  color: Colors.red[700],

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }



  Widget _buildInfoCard() {

    return Card(

      elevation: 4,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: donorsList.first.entries.map((entry) {

            if (entry.key == 'name' || entry.key == 'bloodGroup') {

              return const SizedBox.shrink();

            }

            return Padding(

              padding: const EdgeInsets.symmetric(vertical: 8),

              child: Row(

                children: [

                  Icon(

                    _getIconForField(entry.key),

                    color: Colors.red[700],

                    size: 24,

                  ),

                  const SizedBox(width: 16),

                  Expanded(

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(

                          _getDisplayName(entry.key),

                          style: TextStyle(

                            fontSize: 12,

                            color: Colors.red[700]?.withOpacity(0.7),

                          ),

                        ),

                        Text(

                          entry.value,

                          style: const TextStyle(

                            fontSize: 16,

                            fontWeight: FontWeight.w500,

                          ),

                        ),

                      ],

                    ),

                  ),

                ],

              ),

            );

          }).toList(),

        ),

      ),

    );

  }



  IconData _getIconForField(String field) {

    switch (field) {

      case 'age':

        return Icons.calendar_today;

      case 'weight':

        return Icons.monitor_weight;

      case 'address':

        return Icons.location_on;

      case 'phone':

        return Icons.phone;

      case 'lastDonation':

        return Icons.bloodtype;

      default:

        return Icons.info;

    }

  }



  String _getDisplayName(String field) {

    switch (field) {

      case 'age':

        return 'Age';

      case 'weight':

        return 'Weight (kg)';

      case 'address':

        return 'Address';

      case 'phone':

        return 'Phone Number';

      case 'lastDonation':

        return 'Last Donation Date';

      default:

        return field;

    }

  }



  Widget _buildRequestItem({

    required String name,

    required String bloodGroup,

    required String location,

    required String urgency,

    required String date,

  }) {

    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 8.0),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(

            name,

            style: const TextStyle(

              fontWeight: FontWeight.bold,

              fontSize: 16,

            ),

          ),

          Text('Blood Group: $bloodGroup'),

          Text('Location: $location'),

          Text('Urgency: $urgency'),

          Text('Date: $date'),

          const SizedBox(height: 8),

          Row(

            children: [

              Expanded(

                child: ElevatedButton(

                  onPressed: () {

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(

                      const SnackBar(

                        content: Text('Request accepted! The recipient will be notified.'),

                        backgroundColor: Colors.green,

                      ),

                    );

                  },

                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.green[600],

                    foregroundColor: Colors.white,

                  ),

                  child: const Text('Accept'),

                ),

              ),

              const SizedBox(width: 8),

              Expanded(

                child: OutlinedButton(

                  onPressed: () {

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(

                      const SnackBar(

                        content: Text('Request declined'),

                        backgroundColor: Colors.red,

                      ),

                    );

                  },

                  style: OutlinedButton.styleFrom(

                    foregroundColor: Colors.red[700],

                  ),

                  child: const Text('Decline'),

                ),

              ),

            ],

          ),

        ],

      ),

    );

  }



  Widget _buildDonationHistory() {

    final List<Map<String, String>> donationHistory = [

      {

        'date': '2024-02-15',

        'location': 'City Hospital',

        'recipient': 'Sarah Johnson',

        'bloodGroup': 'O+',

        'units': '1',

        'purpose': 'Emergency Surgery',

        'doctor': 'Dr. Smith',

        'hemoglobin': '14.5',

        'nextEligible': '2024-05-15',

      },

      {

        'date': '2023-11-20',

        'location': 'Red Cross Center',

        'recipient': 'Michael Brown',

        'bloodGroup': 'O+',

        'units': '2',

        'purpose': 'Cancer Treatment',

        'doctor': 'Dr. Johnson',

        'hemoglobin': '15.0',

        'nextEligible': '2024-02-20',

      },

      {

        'date': '2023-08-05',

        'location': 'Memorial Hospital',

        'recipient': 'Emily Davis',

        'bloodGroup': 'O+',

        'units': '1',

        'purpose': 'Accident Victim',

      },

      {

        'date': '2023-05-12',

        'location': 'General Hospital',

        'recipient': 'David Wilson',

        'bloodGroup': 'O+',

        'units': '1',

        'purpose': 'Scheduled Surgery',

      },

    ];



    return Card(

      elevation: 4,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                const Text(

                  'Donation History',

                  style: TextStyle(

                    fontSize: 20,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                Text(

                  'Total Donations: ${donationHistory.length}',

                  style: TextStyle(

                    color: Colors.red[700],

                    fontWeight: FontWeight.bold,

                  ),

                ),

              ],

            ),

            const SizedBox(height: 16),

            ...donationHistory.map((donation) => Column(

              children: [

                Padding(

                  padding: const EdgeInsets.symmetric(vertical: 12),

                  child: Row(

                    children: [

                      Container(

                        padding: const EdgeInsets.all(8),

                        decoration: BoxDecoration(

                          color: Colors.red[50],

                          borderRadius: BorderRadius.circular(8),

                        ),

                        child: Icon(Icons.bloodtype, color: Colors.red[700]),

                      ),

                      const SizedBox(width: 16),

                      Expanded(

                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [

                                Text(

                                  'Donated on ${donation['date']}',

                                  style: const TextStyle(

                                    fontWeight: FontWeight.bold,

                                  ),

                                ),

                                Text(

                                  '${donation['units']} unit(s)',

                                  style: TextStyle(

                                    color: Colors.red[700],

                                    fontWeight: FontWeight.bold,

                                  ),

                                ),

                              ],

                            ),

                            const SizedBox(height: 4),

                            Text('Location: ${donation['location']}'),

                            Text('Recipient: ${donation['recipient']}'),

                            Text('Blood Group: ${donation['bloodGroup']}'),

                            Text('Purpose: ${donation['purpose']}'),

                            Text('Doctor: ${donation['doctor']}'),

                            Text('Hemoglobin Level: ${donation['hemoglobin']} g/dL'),

                            Text('Next Eligible Date: ${donation['nextEligible']}'),

                          ],

                        ),

                      ),

                    ],

                  ),

                ),

                if (donation != donationHistory.last)
                  Divider(color: Colors.grey[300]),

              ],

            )).toList(),

          ],

        ),

      ),

    );

  }



  Widget _buildRewardPoints() {
    // Sample donation history data - should match the data in _buildDonationHistory()
    final List<Map<String, String>> donationHistory = [
      {
        'date': '2024-02-15',
        'location': 'City Hospital',
        // ... other donation details ...
      },
      // ... other donations ...
    ];
    
    int totalDonations = donationHistory.length;
    int rewardPoints = totalDonations * 100; // 100 points per donation

    String rewardTier = _calculateRewardTier(rewardPoints);

    

    return Card(

      elevation: 4,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                const Text(

                  'Reward Points',

                  style: TextStyle(

                    fontSize: 20,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                Container(

                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

                  decoration: BoxDecoration(

                    color: Colors.red[50],

                    borderRadius: BorderRadius.circular(20),

                  ),

                  child: Text(

                    rewardTier,

                    style: TextStyle(

                      color: Colors.red[700],

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

              ],

            ),

            const SizedBox(height: 16),

            Row(

              children: [

                Icon(Icons.stars, color: Colors.red[700], size: 32),

                const SizedBox(width: 8),

                Text(

                  '$rewardPoints points',

                  style: const TextStyle(

                    fontSize: 24,

                    fontWeight: FontWeight.bold,

                  ),

                ),

              ],

            ),

            const SizedBox(height: 8),

            Text(

              'Total Donations: $totalDonations',

              style: TextStyle(

                color: Colors.grey[600],

              ),

            ),

            const SizedBox(height: 16),

            LinearProgressIndicator(

              value: _calculateProgressToNextTier(rewardPoints),

              backgroundColor: Colors.red[100],

              valueColor: AlwaysStoppedAnimation<Color>(Colors.red[700]!),

            ),

            const SizedBox(height: 8),

            Text(

              _getNextTierMessage(rewardPoints),

              style: TextStyle(

                color: Colors.grey[600],

                fontSize: 12,

              ),

            ),

          ],

        ),

      ),

    );

  }



  String _calculateRewardTier(int points) {

    if (points >= 1000) return 'Platinum Donor';

    if (points >= 500) return 'Gold Donor';

    if (points >= 300) return 'Silver Donor';

    return 'Bronze Donor';

  }



  double _calculateProgressToNextTier(int points) {

    if (points >= 1000) return 1.0;

    if (points >= 500) return (points - 500) / 500.0;

    if (points >= 300) return (points - 300) / 200.0;

    return points / 300.0;

  }



  String _getNextTierMessage(int points) {

    if (points >= 1000) {

      return 'You\'ve reached the highest tier! Thank you for saving lives!';

    }

    if (points >= 500) {

      return '${1000 - points} points to Platinum Donor';

    }

    if (points >= 300) {

      return '${500 - points} points to Gold Donor';

    }

    return '${300 - points} points to Silver Donor';

  }

} 
