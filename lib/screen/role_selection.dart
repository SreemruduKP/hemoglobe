import 'package:flutter/material.dart';

import 'donor_screen.dart';

import 'acceptor_screen.dart';

import 'register_screen.dart';



class RoleSelectionScreen extends StatelessWidget {

  const RoleSelectionScreen({super.key});



  @override

  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(

      key: _scaffoldKey,

      drawer: Drawer(

        child: ListView(

          padding: EdgeInsets.zero,

          children: [

            DrawerHeader(

              decoration: BoxDecoration(

                gradient: LinearGradient(

                  begin: Alignment.topCenter,

                  end: Alignment.bottomCenter,

                  colors: [Colors.red[700]!, Colors.red[500]!],

                ),

              ),

              child: const Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(

                    'Health Tips',

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 24,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  SizedBox(height: 8),

                  Text(

                    'For Blood Donation',

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize: 16,

                    ),

                  ),

                ],

              ),

            ),

            ListTile(

              leading: const Icon(Icons.tips_and_updates),

              title: const Text('Get enough sleep'),

              subtitle: const Text('At least 6 hours before donation'),

            ),

            ListTile(

              leading: const Icon(Icons.restaurant),

              title: const Text('Eat well'),

              subtitle: const Text('Have a healthy meal before donating'),

            ),

            ListTile(

              leading: const Icon(Icons.water_drop),

              title: const Text('Stay hydrated'),

              subtitle: const Text('Drink plenty of water'),

            ),

            ListTile(

              leading: const Icon(Icons.smoke_free),

              title: const Text('Avoid smoking'),

              subtitle: const Text('At least 2 hours before donation'),

            ),

          ],

        ),

      ),

      appBar: AppBar(

        leading: IconButton(

          icon: const Icon(Icons.menu),

          onPressed: () => _scaffoldKey.currentState?.openDrawer(),

        ),

        automaticallyImplyLeading: false,

        backgroundColor: Colors.red[700],

        foregroundColor: Colors.white,

        title: const Text('Select Your Role'),

        actions: [

          IconButton(

            icon: const Icon(Icons.logout),

            onPressed: () => Navigator.pushReplacement(

              context,

              MaterialPageRoute(builder: (context) => const RegisterScreen()),

            ),

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

              child: const Column(

                children: [

                  Icon(

                    Icons.volunteer_activism,

                    size: 48,

                    color: Colors.white,

                  ),

                  SizedBox(height: 16),

                  Text(

                    'Choose Your Path',

                    style: TextStyle(

                      fontSize: 24,

                      fontWeight: FontWeight.bold,

                      color: Colors.white,

                    ),

                  ),

                  Text(

                    'Save lives or find help',

                    style: TextStyle(

                      fontSize: 16,

                      color: Colors.white70,

                    ),

                  ),

                ],

              ),

            ),

            Padding(

              padding: const EdgeInsets.all(24.0),

              child: Column(

                children: [

                  _buildRoleCard(

                    context,

                    title: 'Become a Donor',

                    description: 'Help save lives by donating blood',

                    icon: Icons.favorite,

                    color: Colors.red[50]!,

                    onTap: () => Navigator.pushReplacement(

                      context,

                      MaterialPageRoute(builder: (context) => const DonorScreen()),

                    ),

                  ),

                  const SizedBox(height: 20),

                  _buildRoleCard(

                    context,

                    title: 'Need Blood',

                    description: 'Find blood donors near you',

                    icon: Icons.search,

                    color: Colors.red[100]!,

                    onTap: () => Navigator.pushReplacement(

                      context,

                      MaterialPageRoute(builder: (context) => const AcceptorScreen()),

                    ),

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }



  Widget _buildRoleCard(

    BuildContext context, {

    required String title,

    required String description,

    required IconData icon,

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

          padding: const EdgeInsets.all(24),

          decoration: BoxDecoration(

            color: color,

            borderRadius: BorderRadius.circular(16),

          ),

          child: Row(

            children: [

              Container(

                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(

                  color: Colors.white,

                  shape: BoxShape.circle,

                  boxShadow: [

                    BoxShadow(

                      color: Colors.black.withOpacity(0.1),

                      blurRadius: 8,

                      offset: const Offset(0, 4),

                    ),

                  ],

                ),

                child: Icon(icon, color: Colors.red[700], size: 32),

              ),

              const SizedBox(width: 16),

              Expanded(

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(

                      title,

                      style: TextStyle(

                        fontSize: 20,

                        fontWeight: FontWeight.bold,

                        color: Colors.red[700],

                      ),

                    ),

                    const SizedBox(height: 4),

                    Text(

                      description,

                      style: TextStyle(

                        fontSize: 14,

                        color: Colors.red[700]?.withOpacity(0.7),

                      ),

                    ),

                  ],

                ),

              ),

              Icon(

                Icons.arrow_forward_ios,

                color: Colors.red[700],

                size: 20,

              ),

            ],

          ),

        ),

      ),

    );

  }

} 
