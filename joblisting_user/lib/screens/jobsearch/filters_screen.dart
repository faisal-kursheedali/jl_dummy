import 'package:flutter/material.dart';
import '../../app/constant/app_colors.dart';
import '../../ui_utils/strings.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Map<String, bool> expandedItems = {
    AppStrings.jobType: false,
    AppStrings.experience: false,
    AppStrings.location: false,
    AppStrings.salaryAmount: false,
    AppStrings.jobLevel: false,
    AppStrings.jobCategory: false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          AppStrings.filters,
          style: TextStyle(color: AppColor.grayColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: expandedItems.keys.map((item) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: AppColor.lightBlack),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 8.0),
                    child: ExpansionTile(
                      collapsedBackgroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      title: Text(item),
                      initiallyExpanded: expandedItems[item]!,
                      onExpansionChanged: (bool isExpanded) {
                        setState(() {
                          expandedItems[item] = isExpanded;
                        });
                      },
                      children: [
                        _buildExpansionContent(item),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      // Add reset functionality
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: AppColor.lightPurple),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 30.0,
                      ),
                    ),
                    child: const Text(AppStrings.reset),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add apply functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.lightPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 30.0,
                      ),
                    ),
                    child: const Text(
                      AppStrings.apply,
                      style: TextStyle(
                        color: Colors.white,
                      ),
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

  Widget _buildExpansionContent(String title) {
    if (title == AppStrings.jobType) {
      const SizedBox(height: 8);
      return const JobTypeContent();
    } else if (title == AppStrings.experience) {
      const SizedBox(height: 8);
      return const ExperienceContent();
    } else if (title == AppStrings.location) {
      const SizedBox(height: 8);
      return const LocationContent();
    } else if (title == AppStrings.salaryAmount) {
      const SizedBox(height: 8);
      return const SalaryAmountContent();
    } else if (title == AppStrings.jobLevel) {
      const SizedBox(height: 8);
      return const JobLevelContent();
    } else if (title == AppStrings.jobCategory) {
      const SizedBox(height: 8);
      return const JobCategoryContent();
    } else {
      return Container();
    }
  }
}

class JobTypeContent extends StatefulWidget {
  const JobTypeContent({super.key});

  @override
  State<JobTypeContent> createState() => _JobTypeContentState();
}

class _JobTypeContentState extends State<JobTypeContent> {
  String? selectedJobType = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('On site'),
          leading: Radio(
            value: 'On site',
            groupValue: selectedJobType,
            onChanged: (value) {
              setState(() {
                selectedJobType = value; // Update the selected value
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          title: const Text('Remote Job'),
          leading: Radio(
            value: 'Remote Job',
            groupValue: selectedJobType,
            onChanged: (value) {
              setState(() {
                selectedJobType = value; // Update the selected value
              });
            },
          ),
        ),
      ],
    );
  }
}

class ExperienceContent extends StatefulWidget {
  const ExperienceContent({super.key});

  @override
  State<ExperienceContent> createState() => _ExperienceContentState();
}

class _ExperienceContentState extends State<ExperienceContent> {
  String? selectedExperience;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCheckBoxListTile('No Experience'),
        _buildCheckBoxListTile('Upto 1 Year'),
        _buildCheckBoxListTile('2 - 3 Years'),
        _buildCheckBoxListTile('3 - 5 Years'),
        _buildCheckBoxListTile('5+ Years'),
      ],
    );
  }

  Widget _buildCheckBoxListTile(String title) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: selectedExperience == title,
        onChanged: (bool? value) {
          setState(() {
            selectedExperience = value == true ? title : null;
          });
        },
      ),
    );
  }
}

class LocationContent extends StatefulWidget {
  const LocationContent({super.key});

  @override
  State<LocationContent> createState() => _LocationContentState();
}

class _LocationContentState extends State<LocationContent> {
  String? selectedLocation = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRadioListTile('United States'),
        _buildRadioListTile('India'),
        _buildRadioListTile('United Arab Emirates'),
        _buildRadioListTile('United Kingdom'),
      ],
    );
  }

  Widget _buildRadioListTile(String title) {
    return ListTile(
      title: Text(title),
      leading: Radio(
        value: title,
        groupValue: selectedLocation,
        onChanged: (value) {
          setState(() {
            selectedLocation = value;
          });
        },
      ),
    );
  }
}

class SalaryAmountContent extends StatefulWidget {
  const SalaryAmountContent({super.key});

  @override
  State<SalaryAmountContent> createState() => _SalaryAmountContentState();
}

class _SalaryAmountContentState extends State<SalaryAmountContent> {
  String? selectedSalary = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCheckBoxListTile('\$0 - \$50,000'),
        _buildCheckBoxListTile('\$50,000 - \$100,000'),
        _buildCheckBoxListTile('\$100,000+'),
      ],
    );
  }

  Widget _buildCheckBoxListTile(String title) {
    Colors.white;
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: selectedSalary == title,
        onChanged: (bool? value) {
          setState(() {
            selectedSalary = value == true ? title : null;
          });
        },
      ),
    );
  }
}

class JobLevelContent extends StatefulWidget {
  const JobLevelContent({super.key});

  @override
  State<JobLevelContent> createState() => _JobLevelContentState();
}

class _JobLevelContentState extends State<JobLevelContent> {
  String? selectedLevel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCheckBoxListTile('Entry Level'),
        _buildCheckBoxListTile('Mid Level'),
        _buildCheckBoxListTile('Senior Level'),
      ],
    );
  }

  Widget _buildCheckBoxListTile(String title) {
    Colors.white;
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: selectedLevel == title,
        onChanged: (bool? value) {
          setState(() {
            selectedLevel = value == true ? title : null;
          });
        },
      ),
    );
  }
}

class JobCategoryContent extends StatefulWidget {
  const JobCategoryContent({super.key});

  @override
  State<JobCategoryContent> createState() => _JobCategoryContentState();
}

class _JobCategoryContentState extends State<JobCategoryContent> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    Colors.white;
    return Column(
      children: [
        _buildCheckBoxListTile('Accounting & Finance'),
        _buildCheckBoxListTile('Architecture'),
        _buildCheckBoxListTile('Agriculture'),
        _buildCheckBoxListTile('Arts & Crafts'),
        _buildCheckBoxListTile('Content Writing'),
        _buildCheckBoxListTile('Construction'),
        _buildCheckBoxListTile('Designing'),
        _buildCheckBoxListTile('Data Analyst'),
        _buildCheckBoxListTile('Data Scientist'),
        _buildCheckBoxListTile('Healthcare'),
        _buildCheckBoxListTile('Hardware'),
        _buildCheckBoxListTile('Media Reporting'),
        _buildCheckBoxListTile('Sales & Marketing'),
        _buildCheckBoxListTile('Information & Technology'),
        _buildCheckBoxListTile('Social Media Marketing'),
      ],
    );
  }

  Widget _buildCheckBoxListTile(String title) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: selectedCategory == title,
        onChanged: (bool? value) {
          setState(() {
            selectedCategory = value == true ? title : null;
          });
        },
      ),
    );
  }
}
