import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';
import 'package:joblisting_user/screens/applications/job_post_form2.dart';
import 'package:joblisting_user/ui_utils/strings.dart';

class JobPostForm extends StatefulWidget {
  const JobPostForm({super.key});

  @override
  State<JobPostForm> createState() => _JobPostFormState();
}

class _JobPostFormState extends State<JobPostForm> {
  Map<String, bool> expandedItems = {
    AppStrings.jobType: false,
    AppStrings.experience: false,
    AppStrings.location: false,
    AppStrings.salaryAmount: false,
    AppStrings.jobCategory: false,
    AppStrings.jobLevel: false,
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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JobPostScreen2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.lightPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 140,
                  ),
                ),
                child: Text(
                  AppStrings.next,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
    } else if (title == AppStrings.jobCategory) {
      const SizedBox(height: 8);
      return const JobCategoryContent();
    } else if (title == AppStrings.jobLevel) {
      const SizedBox(height: 8);
      return const JobLevelContent();
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
  RangeValues _currentRangeValues = const RangeValues(10000, 25000);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 29),
      child: Column(
        children: [
          Divider(color: Colors.grey[300]),
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 50000,
            divisions: 50,
            activeColor: AppColor.purpleColor,
            inactiveColor: Colors.grey[300],
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.grey[300]),
          const SizedBox(height: 16),
          // Form and To labels and input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Form',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.purpleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      _currentRangeValues.start.round().toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'To',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.purpleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      _currentRangeValues.end.round().toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _buildCheckBoxListTile(String title) {
    Colors.white;
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: false,
        onChanged: (bool? value) {},
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
