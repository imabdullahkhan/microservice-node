This github repo hosts the Source Code is used in MICRO-SERVICE  using Node,AWS

Lets Start with BASIC create simple node application which will be hosted on EC2 instance and will be auto-scaled with load-balancer

1)Push the app.js into your git-repo

2)Open console and Create Security Group
  With in-bound Rules 
  Custom Port 3000
  HTTP 80
  HTTPS 443
  SSH 22


3) Create Launch Template 
  Enter the name
  Check the box of this (
    Provide guidance to help me set up a template that I can use with EC2 Auto Scaling)
  Add Template tags if need
  Select Image (ubuntu)
  Select Instance Type
  Select key Pair
  Select Security Group
  Add User Data from user_data_script.sh
  Click the Create Template Button

4) Create Auto-Scaling Group 
  Enter the name
  Select launch template
  Select VPC 
  Select the Sub-nets
  Attach To new Load Balancer
  Change the Name if you need
  Choose Internet Facing
  Select Group Size 
  Enter Desired capacity
  Enter Minimum capacity
  Enter Maximum capacity
  Select Target Tracking Scaling Policy  For now testing purpose we are setting it to 20 otherwise 70 is Good range depends on your application utilization
  Click on create Auto-Scaling group button
  Wait For Some-Time around 3 Minutes  and then go to Ec2 
  Copy EC2 instances and Load-Balancer IPs in order to check the every thing working properly
  
