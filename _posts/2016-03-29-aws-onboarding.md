---
layout: post
title: "AWS Onboarding"
excerpt: "for System Administration and billing"
tags: [AWS, EC2, cloud, on-boarding]
image:
# feature: pic data center slice 1900x500.jpg
  feature: https://cloud.githubusercontent.com/assets/300046/14622043/8b1f9cce-0584-11e6-8b9f-4b6db5bb6e37.jpg
  credit:
  creditlink:
comments: true
---
<a target="_blank" href="https://wilsonmar.github.io/aws-onboarding/">
https://wilsonmar.github.io/aws-onboarding/</a>

<i>{{ page.excerpt }}</i>
<hr />

{% include _toc.html %}

This is a hands-on tutorial to get new enterprise administrators setup to effecctively access and use the AWS cloud. Here you do some action and explanations and PROTIP advice is provided. PROTIPs included how to install and use AWS CLI automation, smart phone apps, and 3rd party tools used by the pros.

## 3rd-party cloud alternatives

Before we begin, know that the cloud services marketplace has competitors not just among the major cloud providers (Amazon, Microsoft, Google), but also among 3rd-party vendors offering <strong>niche</strong> solutions:

   <a target="_blank" href="https://www.airpair.com/aws/posts/building-a-scalable-web-app-on-amazon-web-services-p1">
   NOTE</a>: Comparison-shop alternatives to services AWS offers:

   ![aws-iam-alts-643x443](https://user-images.githubusercontent.com/300046/38169520-4c6b04b0-3529-11e8-8d00-baf2b1919d8d.png)

## TCO Calculator

   The Total Cost of Ownership calculator is basically a sales tool to calculate savings moving to AWS from on-premises servers:

   * <a target="_blank" href="https://www.awstcocalculator.com/">awstcocalculator.com</a>

   Toggle Basic/Advanced for more fields.

   The instance type is automatically selected based on the memory selected.


## Sign-up for account

1. Use an internet browser to get on the <strong>AWS marketing page</strong> at 

   <a target="_blank" href="https://aws.amazon.com/">https://aws.amazon.com</a> 

2. Get your credit card ready.

   <a target="_blank" href="https://www.linkedin.com/pulse/how-use-aws-free-tips-teaching-college-wong-chun-yin-cyrus-%E9%BB%83%E4%BF%8A%E5%BD%A5-/">PROTIP</a>: You need a credit card to open an account. But to limit your exposure, some people buy a MASTERCARD GIFT CARD from a convenience store to provide AWS.

3. Click the yellow "Sign-Up" button if you don't already have an account.

4. PROTIP: If you are creating a production account for an organization, create an email address which you <strong>use only for managing AWS</strong> and not for regular email use and certainly not for doing shopping on Amazon. 
   
   The account which controls billing is called the <strong>root account</strong>, which as unlimited access to AWS resources and unlimited ability to rack up charges. By resources I mean: users, groups, roles, IAM Access Policies, API keys, etc. globally for all regions.

   Secure that email address with <strong>multi-factor authentication</strong> with Google or whoever hosts your email server. Also have a way for one person (or maximum two) you trust to be able to access the account in case you are not able to.

5. Supply a strong password.

   PROTIP: Use 1Password so that you can easily generate up to <strong>64 character</strong> password, but remember only one password to access the 1Password database of secrets. 1Password encrypts its database so that you can make backups (to a USB drive or secure cloud). I favor 1Password because it provides a way to sync changes with your smartphone without going through the internet.

   Because you only have to remember one master password, you can are free to change various passwords as often as you want with no fear of forgetting them.

6. An example of a value for "AWS account name" is "master-billing".

7. Click "Continue".

   If you have 1Password installed, you would be prompted to create a new account.

8. Provide phone number, address, and credit card.

   Students may want to create several accounts to take advantage of the free tier multiple times. However, uniquely different phone numbers, addresses, and credit cards are not needed for each identity.

9. PROTIP: Where you keep information about your credit card, note the email address and account name using that credit card.

1. Confirm the phone number by answering Amazon's phone call.   

1. For now, click "Free" to select a plan. A <a href="#ComparePlans">comparison on plans is discussed below</a>.

1. Click "Free" to be prompted to sign-in with your new credentials.

   <a name="AccountId"></a>

1. Click your account name at the top black menu for this menu:

   <a target="_blank" href="https://console.aws.amazon.com/billing/home?#/account"><img alt="aws-onboarding-myaccount-184x222-9824.jpg" width="184" src="https://user-images.githubusercontent.com/300046/40592391-ecd60128-61db-11e8-941f-784a35c9d9ff.jpg"></a>

1. Copy the <strong>Account Id</strong> and paste it in the notes associated with where you saed your account email and password (within 1Password).

   PROTIP: This 12 digit number is given out for others to use to sign in using 
   <a href="#SubAccounts">sub-accounts</a>.

1. Scroll down to click "Edit" next to "Alternate Contacts" and put the other person who knows how to get into the account in for the Billing.

1. Scroll down to click Edit to the right of "Configure Security Challenge Questions".
1. Write down your security challenge questions and answers where you wrote your Account Id.

   PROTIP: Treat the answers as another set of passwords because others my discover the real answers via social engineering. Answer with some nonsense that has no basis in reality.


<a name="Billing"></a>

## Billing tasks

"With great power comes great responsibility".

Account administators who hold root accounts linked to credit cards should do the following:

   ### My Much? Estimate bills

1. PROTIP: Before you dive in, calculate your potential bills by providing usage estimates to the <a target="_blank" href="http://calculator.s3.amazonaws.com/index.html">AWS Calculator</a>.

   It has a different sheet for each service. Parameters for EC2 include the number of EC2 instances, hosts, EBS volumes, IPs, data transfer, app and network load balancing. 

   PROTIP: Remember that there is an additional surcharge for support as a percentage of the whole bill. Rates vary depending on the level of support chosen.

2. Budget:

   <a target="_blank" href="
   https://console.aws.amazon.com/billing/home?#/budgets/create?type=COST">
   https://console.aws.amazon.com/billing/home?#/budgets/create?type=COST</a>

   <a target="_blank" href="
   https://aws.amazon.com/premiumsupport/compare-plans/">
   https://aws.amazon.com/premiumsupport/compare-plans</a>

   ### Billing alerts

3. <a target="_blank" href="https://wblinks.com/notes/aws-tips-i-wish-id-known-before-i-started/">NOTE</a>: Setup <a target="_blank" href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/monitor-charges.html">billing alerts and notifications</a>

   Policies for this include:

   * Billing
   * AWSPriceListServiceFullAccess

   ### Define organizations

   Up to 20 linked AWS accounts can be grouped together for consolidated billing under
   "AWS Organizations" to take advantage of volume discounts above.

   Policies for this does not include:

   * AWSOrganizationsServiceTrustPolicy (A policy to allow AWS Organizations to share trust with other approved AWS Services for the purpose of simplifying customer configuration)


   <a name="ComparePlans"></a>

   ### Compare Pricing of Plans

1. Click <a target="_blank" href="https://console.aws.amazon.com/support/plans/home?#/">Amazon's Support Plan page here</a>.

   The Basic account does not enable you to communicate with Amazon people who can answer technical questions.

   The $29/month Developer Plan enables you to open an unlimited number of support cases
   only via email, with a 12-hour response time if "system impaired". Otherwise, the SLA
   is 24 hours.

   The $100/month Business Plan enables you to have 24/7 chat, phone, as well as email access with AWS Support people on an unlimited number of support cases, with a 1-hour response time for "production down" issues, or 4-hour response for "production impaired" issues.

   Amazon also has an Enterprise Plan for $15,000/month to get 15 minute response on "business critical system down" issues. This plan also comes with an assigned TAM (Technical Account Manager).

   These dollar amounts are minimums, not fixed prices.

1. Scroll down to mouse over the "$29" on the Pricing line at the bottom of the table.

   ![aws-onboarding-pricing-179x101-7688](https://user-images.githubusercontent.com/300046/40592743-edf804f8-61df-11e8-82e4-d48308fe1c92.jpg)

   PROTIP: Pricing for Developer support is the Greater of $29 or 3% of monthly AWS usage,
   so you will pay more than $29 if you spend more than $966.67.

1. Scroll back up to click the "Pricing example" link on the right.
1. Notice that if your spend is $2,000, Amazon bills you $60 for support, not $29.

   <img alt="aws-onboarding-price-example-533x307-27004.jpg" width="533" src="https://user-images.githubusercontent.com/300046/40593326-2004f3f2-61e5-11e8-956f-c74bc35a161b.jpg"></a>

1. Click the "Business" and "Enterprise" buttons in the pop-up to see sample volume pricing tiers.

   ### Cases in Support Center

1. To view support cases filed and their status, see:   

   <a target="_blank" href="https://console.aws.amazon.com/support/home">
   https://console.aws.amazon.com/support/home</a>

   Policies for this are:

   * AWSSupportAccess (Allows users to access the AWS Support Center)
   * SupportUser (This policy grants permissions to troubleshoot and resolve issues in an AWS account. This policy also enables the user to contact AWS support to create and manage cases)

1. Scroll down to view videos on specific technical issues by Amazon people.

   On the lower-right corner, there are links to
   AWS Documentation, Getting Started Guides, Knowledge Center, Whitepapers, and AWS Forums.


   ### Inspector service

   The Inspector Service (described <a target="_blank" href="https://aws.amazon.com/inspector/">here</a> automates <strong>security</strong> assessments to help improve the security and compliance of applications deployed on AWS.

   The first 250 agent-assessments is free during your first 90 days. 
   Then it's $0.30 per agent per assessment (agent-assessment) per month. 
   And you can have many agents on each machine.

   What security vulnerabilities an organization has is rather confidential information.
   So be stingy about granting policies related to Inspector:

   Policies for auditors who evaluate security would be:

   * AmazonInspectorReadOnlyAccess (to auditors who evaluate security)
   * SecurityAudit 

   Policies for those who carry out security assessments:

   * AmazonInspectorFullAccess
   * AmazonInspectorServiceRolePolicy grants Amazon Inspector access to AWS Services needed to perform security assessments.

   Related policies include:

   * AWSAccountActivityAccess
   * AWSAccountUsageReportAccess
   * AWSConfigRole
   * AWSResourceGroupsReadOnlyAccess
   * AWSServiceCatalogAdminFullAccess
   * AWSServiceCatalogEndUserFullAccess

   * PowerUserAccess
   * SecretsManagerReadWrite


   <a name="Well-Architected"></a>

   ### Well-Architected Framework

   Enterprise subscribers can have AWS Solution Architects (from <a target="_blank" href="https://aws.amazon.com/professional-services/">Amazon Professional Services</a>)
   conduct a "Well-Architected Review" of advice covered in "Well-Architected Framework" described in <a target="_blank" href="https://www.aws.training/learningobject/curriculum?id=12049">this free video training</a> and books (in pdf and Kindle).

   Topics covered in the Well-Architected Framework:

   * Cost Optimization
   * Performance
   * Security
   * Fault Tolerance
   * Service Limits
   <br /><br />

   There is a separate document/video for each of the above topics.
   
   <a name="TrustedAdvisor"></a>

   ### Trusted Advisor

   "Trusted Advisor" is not a person, but a report.

   The <a target="_blank" href="https://console.aws.amazon.com/trustedadvisor/home?#/dashboard">Trusted Advisor Dashboard</a> reports the result from scans of your account's setup based on the Well-Architected Framework.

   The policy needed for this:

   * AWSTrustedAdvisorServiceRolePolicy

   The AWS CLI command:

   <pre>
   aws support describe-trusted-advisor-check-result \
      --check-id eW7HH0l7J9 \
      --query 'result.sort_by(flaggedResources[?status!="ok"],&metadata
   </pre>

   To get the check-id:

   <pre>
# region must be us-east-1 as it only when support command works
CHECK_ID=$(aws --region us-east-1 support describe-trusted-advisor-checks --language en --query 'checks[?name==`Service Limits`].{id:id}[0].id' --output text)
echo $CHECK_ID
   </pre>

   If you don't have a premium subscription, this error message appears: 

   An error occurred (SubscriptionRequiredException) when calling the DescribeTrustedAdvisorCheckResult operation: AWS Premium Support Subscription is required to use this service.

<a name="MobileApps"></a>

## Mobile apps for smart phones

1. On your Android, Get the <strong>AWS Console</strong> installed:

   <a target="_blank" href="http://www.amazon.com/AWS-Mobile-LLC-Console/dp/B00ATSN730">On Google Android mobile phones</a>

2. On your iOS, open the Store app and search to get <a target="_blank" href="https://itunes.apple.com/us/app/aws-console/id580990573?mt=8">AWS Console</a>. It's from "AMZN Mobile LLC" which creates <a target="_blank" href="https://itunes.apple.com/us/developer/amzn-mobile-llc/id297606954?mt=8">all Amazon's apps</a>.

   PROTIP: These app got low review scores because the app only lets people read-only,
   but not change anything. And the 2FA is clunky.

3. In the Store app, search for "<strong>Google Authenticator</strong>" and install it
   for multi-factor authentication to strength security of your Amazon cloud account.

   PROTIP: Many keep the Authenticator running on their smart phone.

TODO: To avoid embedding an access key with the app (even in encrypted storage), use Amazon Cognito to manage user identity by authenticating users using Login with Amazon, Facebook, Google, or any OpenID Connect (OIDC)–compatible identity provider.<a target="_blank" href="https://aws.amazon.com/blogs/mobile/using-the-amazon-cognito-credentials-provider/">*</a>


<a name="CLI"></a>

## AWS CLI Automation #

In enterprises today, servers are built by
scripts and configuration files
generated from templates.
This is so the build process can be debugged
and changed slightly through the lifecycle from test to prod.

Instead of clicking and typing, server administrators work with
template files in JSON format for Cloud Formation or Terraform to process.

The next step up is to use Atlas
which generates  
JSON files based on information typed into their web Consoles.

The <a href="#CLI">command line interface</a>
is used by programs rather than the manual Console.


<a name="CLI"></a>

### AWS CLI install #

PROTIP: There are several ways to install AWS CLI using Python.

1. The simplest and most reliable for me is to use HomeBrew on Macs:

   <tt><strong>
   brew install awscli
   </strong></tt>

   Alternately, one can use <tt>pip install awscli --upgrade --user --ignore-installed six</tt>
   installed from <a target="_blank" href="https://pypi.org/project/awscli/">https://pypi.org/project/awscli</a>. But when I did, aws cannot be found.

   Another alternative to install (on CentOS 7) is:

   <pre>
   curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
   unzip awscli-bundle.zip 
   sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
   </pre>

2. Verify what version of awscli you have installed:

   <pre><strong>aws --version
   </strong></pre>

   Something went wrong if your response is:

   <pre>-bash: aws: command not found</pre>

   The expected sample response (May 28, 2018):

   <pre>
   aws-cli/1.15.20 Python/3.6.5 Darwin/17.5.0 botocore/1.10.20
   </pre>

   PROTIP: Awscli now uses <strong>Python 3</strong>, not 2.7.

   ### AWS Boto for Python

   PROTIP: "AWS SDK for Python" enables your Python (.py) programs to invoke AWS CLI commands.

   <a target="_blank" href="https://github.com/boto/botocore">
   The Python package botocore on GitHub</a>
   provides a low-level foundation for AWS CLI software.

3. To install Boto3:

   <tt><strong>
   pip install boto3 --upgrade --ignore-installed six
   </strong></tt>

   Code for boto3 is obtained from <a target="_blank" href="https://github.com/boto/boto3">https://github.com/boto/boto3</a>. Read about it at <a target="_blank" href="https://aws.amazon.com/sdk-for-python/">https://aws.amazon.com/sdk-for-python</a>. 

   NOTE: The package is installed into folder:<br />
   <tt>/usr/local/lib/python2.7/site-packages/boto3/*</tt>


   <a name="Autocompletion"></a>

   ### Bash Shell completions

3. To enable bash completion for aws commands at the Linux shell:

   <tt><strong>
   echo 'complete -C aws_completer aws' >> ~/.bashrc
   </strong></tt>

4. Test out autocompletion by typing the first two characters and pressing Tab for a list of all aws cli commands that begin with those characters:


   ### AWS Shell completion

   PROTIP: For automatic complex autocompletion of AWS CLI commands, there is a 3rd-party utility that provides a shell GUI that suggest as you type:

5. To install the <a target="_blank" href="https://medium.com/@cuttenweiler/aws-shell-i-think-im-in-love-d39878c3e7b7">awesome</a> AWS Shell:

   <tt><strong>
   pip install aws-shell
   </strong></tt>

   Read about it at <a target="_blank" href="https://github.com/awslabs/aws-shell">https://github.com/awslabs/aws-shell</a>

   NOTE: The package is installed in folders:<br />
   /usr/local/bin/aws-shell

6. To enable AWS Shell:

   <tt><strong>
   aws-shell
   </strong></tt>

   You show now be in the sub-shell with prompt:

   <pre>aws></pre>

   <img alt="aws-onboarding-aws-shell-config-207x58-5051.jpg" width="207" src="https://user-images.githubusercontent.com/300046/40611542-eccae42a-6233-11e8-956c-ac85fe8baae3.jpg">

7. Exit aws-shell back to bash:

   <tt><strong>
   .exit
   </strong></tt>

   Alternately, <tt>.quit</tt> works too.

   <a name="ConfigCmd"></a>

   ### IAM user configuration

   Regardless of how you get the command:

7. Run the command to create files in folder ~/aws referenced by all other aws cli commands:

   <tt><strong>
   aws configure --profile root-admin-work  
   </strong></tt>

   PROTIP: The example "root-admin-work" would be replaced with the user's account name being created. Different accounts may be needed for different permissions in prod vs. dev use. Having separate access keys for different applications also generates distinct entries in AWS CloudTrail log files, which makes it easier to determine which application performed specific actions.

   Without the profile specification, "aws configure" by itself defines default credentials.

   The command prompts you for:

   <pre>AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
   AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
   Default region name [None]: us-west-2
   Default output format [None]: json
   </pre>

   <a target="_blank" href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html">PROTIP</a>: If you do not explicitly specify an endpoint, US West (Oregon) `us-west-2` is the default Region.

   The default output format is `json`.

   PROTIP: The aws configure command creates key/value pairs "aws_access_key_id" and "aws_secret_access_key" in file <tt>credentials</tt> for use by all AWS SDKs.
   Key/value pairs "region" and "output" are saved in file <tt>config</tt> used by the CLI.

   TODO: http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-environment

8. The region in ~/.aws/config can be set also by:

   <pre><strong>
   aws configure set profile.prod.region us-west-2
   </strong></pre>   




   ### Roles for Tasks

   TODO: Temporary security credentials <a target="_blank" href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">Roles for Tasks</a>
   stored in ~/.aws/config file:

   <pre>
[profile iam-role]
role_arn = arn:aws:iam::<em>ACCOUNT_ID</em>:role/<em>IAM_ROLE</em>
source_profile = iam-user
output = json
region = eu-west-1
   </pre>

   PROTIP: The ~/.aws/config file also houses settings that speed up S3 sync.

   <pre>
[profile default]
...
s3 =
  max_concurrent_requests = 100
  max_queue_size = 10000
  use_accelerate_endpoint = true
   </pre>


   ### Configure profiles

   PROTIP: You'll likely need to use several AWS accounts, so specify a profile for
   each account.


   ### Services list

   Now that you have permissions after configuration:

4. For a list of Amazon services with command access:

   <tt><strong>
   aws commands help
   </strong></tt>

   PROTIP: Drag the left/right edge of the Terminal to widen the screen.

   See http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-using.html


<a name="AWSConsole"></a>

## AWS Services Management Console

1. If you are at the AWS marketing page, click "My Account" for this menu:

   <a target="_blank" href="https://aws.amazon.com/">
   <img alt="aws-onboarding-landing-250x252-18241" width="250" src="https://user-images.githubusercontent.com/300046/40591769-685c5502-61d4-11e8-8fbe-bcbf70d5e515.jpg"></a>
   
2. Get the <strong>AWS Management Console</strong>:

   <a target="_blank" href="
   https://console.aws.amazon.com/console/home">
   https://console.aws.amazon.com/console/home</a>
   
   ### Amazon services

3. Click to view all <strong>Services</strong> at the upper-left black menu band.

   https://aws.amazon.com/documentation/

4. BONUS: Want to be a real Amazon Geek?

   <a target="_blank" href="http://aspenroo.com/challenge-me.php">
   Memorize what each service belongs in which category (drag and drop)</a>


   ### Claim S3 Bucket names

   The AWS Account Administrator has a fudiciary responsibility to secure 
   Intellectual Property assets.

   S3 Bucket names are universally unique among all AWS customers.
   So just as there are domain name squatters who register and sit on .com host names
   for sale at high prices to those who actually use the names,
   the administrator of root accounts for an organization should
   register your organization's brand names before others get them first.

   To create a bucket for each host name registered on GoDaddy, Google Domains, etc.

4. Click S3 from among services.
5. Click the blue "Create bucket" button.
6. Type in the host name (such as "wilsonmar.com") in the Bucket name field.
7. Select your home Region.

   PROTIP: Claiming a Bucket name in one region locks it up for all Regions.

8. Click "Next".
9. Click "Next".
10. Click "Next" to manage users.
11. Click "Create Bucket".


## Security services

1. Scroll to the category "<strong>Security, Identify, and Compliance</strong>" list of ever-growing services:

   ![aws-iam-svcs-cat-207x318-16992](https://user-images.githubusercontent.com/300046/38159747-1bb95b90-346c-11e8-940a-a0f3de709dfa.jpg)

   * WAF (Web Application Firewall) provides application-level attacks such as SQL injection and cross-site scripting.
   * <strong>Shield</strong> protects against DDoS (Denial of Service) attacks

   * Click "Artifact" (at the bottom of the list) to read documents associated with security certifications.
   * Cognito provides an API to federate authentication with various social identity providers (Facebook, Twitter, etc.)
   * GuardDuty
   * Inspector
   * Amazon Macie
   * AWS Single Sign-On
   * Certificate Manager manages security certificates
   * Cloud HSM provides 
   * Directory Service
   <br /><br />

   What's not listed is the <a target="_blank" href="https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html?icmpid=docs_iam_console">AWS Best Practices</a> is:

   * Cloud Trail audits usage


   <a name="Lockdown"></a>

   ## Lockdown Root Account #

6. From the AWS Console, select <a target="_blank" href="https://console.aws.amazon.com/iam/home">IAM</a> (for Identity Access Management) for the list <strong>Security Status</strong>

   ![aws-iam-status-334x256-24837](https://user-images.githubusercontent.com/300046/38159769-9adbb7b0-346c-11e8-8cb9-044eba2a18f0.jpg)

   To get back to this screen, click "Dashboard" on the IAM menu on the left.

   The FAQ to this is at <a target="_blank" href="https://aws.amazon.com/iam/faqs/">https://aws.amazon.com/iam/faqs</a>

10. Click on "Delete your root access key".

11. Check "Don't show me this message again" and Continue to Security Credentials.


    ### MFA (Multi-Factor Authentication)

    Have AWS text or call your smartphone (a virtual device) to make sure that it's really you logging in.
 
15. Click <strong>Activate MFA on your root account</strong>.
15. Click <strong>Mange MFA</strong>.
16. Select "A virtual MFA device".
17. Click "Next Steps" for the note about installing Google Authentiator.
18. On your iPhone or Android, if you have not already installed <strong>Google Authenticator</strong> app, do it.
18. In the the Google Authenticator app, click the "+" icon at the top of the screen.
19. Click "Scan barcode".
19. Align the QR code (with the square of dots) within the green box.
21. Wait for the Google Authenticator app to display two codes. Under the codes we want now 
    begins with "root-account-mfa-device@" followed by the 12-digit <a href="#AccountId">Account Id</a>.
22. Type the first code for the account into the AWS Console website "Authentication code 1".

    PROTIP: Do not type the space between numbers so that you enter only 6 digits.

23. Press Tab and type the second code in "Authentication code 2".

    PROTIP: A new code is created every minute.

23. Scroll down to click "Activate virtual MFA" at the bottom of the screen.

    ### MFA in profile

    To specify use of MFA in an assumed role provider profile, see this example of credentials file:

    <pre>
    [profile prod-access]
    role_arn=arn:aws:iam::123456789012:role/ReinventProdAccess
    source_profile=development

    [profile prod-full-s3-access]
    role_arn=arn:aws:iam::123456789012:role/FullS3Access
    source_profile=development
    mfa_serial=arn:aws:iam::18490616333:mfa/james
    </pre>

24. Test

    <pre><strong>aws s3 ls --profile prod-full-s3-access</strong></pre>

    Enter MFA code: _






    ### Create Admin sub-account

1. In the <a target="_blank" href="https://console.aws.amazon.com/iam/home#/home">IAM page</a>
   click "Create individual IAM users". What it says is important:

   "Create IAM users and give them only the permissions they need. Do not use your AWS root account for day-to-day interaction with AWS, because the root account provides unrestricted access to your AWS resources."

2. Click "Manage users".
3. Click "Add User".
4. PROTIP: For the user name field, define a pattern of up to <strong>64 characters</strong>
   with <strong>dashes</strong> (instead of spaces and underlines) to separate words.

   For the Administrator to do work (of assigning): 

   <tt><strong>root-admin-work</strong></tt>

5. Click "Programmatic access".
6. If you would like to use AWS Management Console access, leave the default for
   Autogenerated password because you'll create a new password at next sign-in.
7. Click "Next: Permissions".

   We'll <a href="#Groups">add groups later, below</a>.

8. Click "Attach existing policies directly" because the Admin account it is limited.

9. Rather than granting "<strong>AdministratorAccess</strong>" which gives all access, 
   give policy to what :

   * SystemAdministrator
   * IAMFullAccess covers the others:

      * IAMReadOnlyAccess
      * IAMSelfManageServiceSpecificCriteria
      * IAMUserChangePassword
      * IAMUserSSHKeys
   
10. Click "Next: Review".
11. Click "Create user".

    ### Inform user of credentials

12. To see what is sent if you click "Send email", right-click on the link and "Copy Link", then paste in a text editor to see:

    <pre>subject=Welcome to Amazon Web Services
    body=Hello,  You have been given access to the AWS Management Console for the Amazon Web Services account ID ending in 8630. You can get started by using the sign-in information provided below.%0A%0ASign-in URL: https://103265058630.signin.aws.amazon.com/console%0AUser name: root-admin-work   
    Your initial sign-in password will be provided separately from this email. When you sign in for the first time, you must change your password. 
    Sincerely, Your AWS Account Administrator</pre>

13. PROTIP: Along with the Access Key Id and Secret access key, the default Region and format are also required to perform "aws configure", so add that information in the email.

    PROTIP: Add what AWS Groups and associated Policies the user has been given.

    PROTIP: Also include in the email, for those who
    use AWS CLI, how to install it and 3rd-party tools.
    
    For those who use the AWS Console GUI, explain the mobile apps to install.
    Provide them the URL with the region included, such as:

    <a target="_blank" href="https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2">https://us-west-2.console.aws.amazon.com/lambda/home?region=us-west-2</a>

    NOTE: Baking different zones into Console URLs makes for more direct connections and removes issues from using a single URL/DNS.

14. Click "Download .csv" to download a "credentials.csv" file to your Downloads folder.
    It contains columns are a couple columns different than the "Add User" GUI:

    <tt>User name, Password, Access key ID, Secret access key, Console login link</tt>

    The "Console login link" is the "Sign-in URL" in the email.


    ### Apply an IAM password policy 

12. Click "Manage Password Policy" so AWS will ensure that "strong" passwords are used (and not easy to guess ones).
    AWS defaults are terrible:

   <img alt="aws-iam-weak-386x336-39852" width="386" src="https://user-images.githubusercontent.com/300046/38160240-8cbdb006-3477-11e8-914c-faea51864405.jpg"></a>

   PROTIP: Over time, as hackers have access to more powerful computers that can guess passwords quicker, larger passwords are necessary to make them more difficult to crack.

13. PROTIP: The largest Minimum password length AWS allows is 128 characters. But 1Password can generate up to only 64 characters. Practically, 22 characters is a reasonable minimum. Require at least one number and one non-alphanumeric character.

    ![aws-iam-1password-291x259-19343](https://user-images.githubusercontent.com/300046/38160291-93acae16-3478-11e8-80ac-7d5ae3bbd5c4.jpg)

    PROTIP: Each site may have different rules about what special characters are allowed.
    So generate a smaller string, then manually add special characters. Copy the final string before pasting into the form.

14. Click "Apply password policy".

    ### Deactivate regions not used

    On the same "Account settings" page:

14. Scroll down to "Security Token Service Regions" and deactivate regions your organization are not using.

    PROTIP: Select a Region where most of your target users are located.
    New services are usually restricted to one region, such as N. Virginia or N. California where AWS does development work.


    <a name="SignInAdmin"></a>

    ### Admin Sign In

1. Sign out and sign in again with the newly created admin sub-account.


    <a name="Groups"></a>

    ### Define groups to assign permissions 

    PROTIP: For a user to do something usually require several AWS resources.
    So several permissions need to be granted to a user.
    To simplify assignments, we define Groups of permissions which we then can assign to each user.

    In other words, An IAM group is a management convenience to manage the same set of permissions for a set of IAM users.

    The AWS CLI command to create a group named "MyIamGroup" is:

   <pre>
aws iam create-group --group-name MyIamGroup
   </pre>

   The response is:

   <pre>
{
    "Group": {
        "GroupName": "MyIamGroup",
        "CreateDate": "2012-12-20T03:03:52.834Z",
        "GroupId": "AKIAI44QH8DHBEXAMPLE",
        "Arn": "arn:aws:iam::123456789012:group/MyIamGroup",
        "Path": "/"
    }
}
   </pre>

    The AWS CLI command to create a S3 security group:

   <pre>
aws ec2 create-security-group --group-name my-sg --description "My security group"
   </pre>

   A sample response:

   <pre>{
   "GroupId": "sg-903004f8"
   }</pre>

27. Click Manage Groups then Create New Group.
  
    PROTIP: Groups are usually associated with a particular job: admin, sales, HR, front-end developer, back-end developer, etc. 
    
    A user can belong to multiple groups.
    More complex organizations manage differences in permissions for company, division, project, location, job level, etc. So 128 characters may not be enough if large words are used. Thus, abbreviate and use acronyms.

    PROTIP: Put abbreviations and acronyms in a wiki publicly available to avoid duplicate usage.

28. "aws_iot_buttons" is the group name I use as an example.

   PROTIP: Use dashes. Space characters are not allowed.
   On March 1, 2018 AWS removed the ability to use underscores in S3 bucket names.

   The list shown are "AWS Managed".

29. Click on Policy Type to select Job function.

30. PROTIP: Instead of scrolling down the massive list in <strong>Attache Policy</strong> (Alexa, Amazon, AWS, etc.),
    type in the Filter field the first few letters (such as "IoT") and the list gets smaller. Notice the filter you type is applicable to not just characters beginning with what you typed, but also characters inside names as well.

31. Click to select.
32. Click "Create Group".

    Note different policies have different levels of access, with admin having more capabilities than "read only" ones.

33. Names shown on the screen is called a "Policy Summary".
34. Click "JSON" to see the file that AWS reads to assign policies. Here you seen what <strong>Actions</strong> the policy allows.

35. Click "Access Advisor" to see users who have been assigned to use the policy.

    https://docs.aws.amazon.com/iot/latest/developerguide/create-iot-policy.html





    ### Access keys (access key ID and secret access key) 

    See that "AWS recommends that you rotate your access keys every 90 days"?
    Some find it easier to remember by doing it on the first day of each month.
    Why? There are thousands of big computers around the world literally staying up at night trying different combinations.
   
24. PROTIP: Make an appointment on your Calendar with a recurring schedule.

    PROTIP: Rotation applies to access key of IAM child accounts, not the root account.

    You don't want programmatic access to your root account, so you don't need no stinkin' keys.

25. Click Delete to the key. Write down the date Created.
26. Don't create a new Access Key.



    ### Create IAM Users

36. Click Users on the left menu.
36. Click Add User.
36. Specify User Name. For example: user1@myco.com

    PROTIP: Use underscores to separate words in IAM User Names rather than spaces.

36. Check "Programmatic Access".
36. Uncheck "User must create a new password at next sign-in".
36. Click "Next: Permissions".
36. Click "Attach existing policies directly" for the first user.

    PROTIP: The policy attached depends on what the user will be allowed to do.

37. Send to each user the AccountId, UserName using a different mode of communication than the  password.
37. User signs in using the credentials Account Id, the UserName, and password
37. Click "Send email"

    PROTIP: Send credentials to your <strong>alternate email</strong> rather than to a cloud drive (Amazon, Google, Box, etc.); an email account that you setup with a fake birthdate and other personal information; one you never give out to anyone.

Send out an email to Notify users
https://103265058630.signin.aws.amazon.com/console

Send out passwords on a different channel (not just another email).

<hr />

   <a name="IAM-CLI"></a>

   ### IAM CLI #

   AWS Identity and Access Management (IAM) controls access to
   users, groups, roles, and policies.

6. List users:

   <pre><strong>
   aws iam list-users --query Users[*].UserName
   </strong></pre>

8. List groups which the user belongs to :

   <tt><strong>
   aws iam list-groups-for-user \-\-username ???
   </strong></tt>

9. Create a new user named "MyUser":

   <pre>
   aws iam create-user --user-name MyUser
 </pre>

   The response is:

   <pre>
{
    "User": {
        "UserName": "MyUser",
        "Path": "/",
        "CreateDate": "2012-12-20T03:13:02.581Z",
        "UserId": "AKIAIOSFODNN7EXAMPLE",
        "Arn": "arn:aws:iam::123456789012:user/MyUser"
    }
}</pre>

1. Add the user to the group:

   <pre>aws iam add-user-to-group --user-name MyUser --group-name MyIamGroup</pre>

1. To verify that the MyIamGroup group contains the MyUser, use the get-group command:

    <pre>aws iam get-group --group-name MyIamGroup</pre>

    The response:

    <pre>
    {
        "Group": {
            "GroupName": "MyIamGroup",
            "CreateDate": "2012-12-20T03:03:52Z",
            "GroupId": "AKIAI44QH8DHBEXAMPLE",
            "Arn": "arn:aws:iam::123456789012:group/MyIamGroup",
            "Path": "/"
        },
        "Users": [
            {
                "UserName": "MyUser",
                "Path": "/",
                "CreateDate": "2012-12-20T03:13:02Z",
                "UserId": "AKIAIOSFODNN7EXAMPLE",
                "Arn": "arn:aws:iam::123456789012:user/MyUser"
            }
        ],
        "IsTruncated": "false"
    }</pre>



## Linux AMIs #

Types of operating system AMI:

   * Amazon Linux 2014.09.2 (CentOS)
   * Red Hat Enterprise Linux 6.6 (RHEL)
   * SUSE Linux Enterprise Server 12
   * Ubuntu Server 14.04

<hr />

## Advanced User Data #

https://gist.github.com/mikepfeiffer/

   <pre>
   </pre>

* https://aws.amazon.com/powershell  
   AWS Powershell for Windows</a>

   aws Get-AWSCredentials -ListProfiles



## Diagrams #

<a target="_blank" href="https://www.processon.com/">
ProcessOn.com</a>
provides a free on-line tool to draw diagrams such as
<a target="_blank" href="https://www.processon.com/view/56e785b1e4b05387d0391d33">
this</a>

At <a target="_blank" href="https://aws.amazon.com/architecture/icons/">
architecture/icons</a> Amazon provides a sample .PPTX (PowerPoint 2010+) file
(AWS_Simple_Icons_PPT_v16.2.22.zip). Lines used to illustrate the hierarchy:
<amp-img width="238" height="183" alt="aws simple icons-238x183-63"
layout="responsive" src="https://cloud.githubusercontent.com/assets/300046/16263922/ed4eb538-3833-11e6-8a22-b72cb8f12c32.jpg"></amp-img>
PROTIP: Use different colors for lines and text to reduce visual confusion.


You can also download a zip containing .png and .svg files of icons
(AWS_Simple_Icons_EPS-SVG_v16.2.22.zip).


## Social #

* <a target="_blank" href="https://www.reddit.com/r/aws/">
  Reddit on AWS</a>

* https://console.aws.amazon.com/ec2/home

* Sign-up to receive the <a target="_blank" href="https://www.amazon.com/AWS-Architecture-Monthly-FREE-Subscription/dp/B077F2P7DH/ref=pd_sim_405_1?_encoding=UTF8&psc=1&refRID=8JWKBP6Z7PVJZG34T3AW">AWS Architecture Monthly (FREE Subscription)</a> on your Kindle account.


## Tutorial Rock Stars and their presentations #

Jeff Barr (<a target="_blank" href="https://www.twitter.com/@jeffbarr/">@jeffbarr</a>),
AWS Chief Evangelist
makes announcements of all new stuff at the company's
   <a target="_blank" href="https://aws.amazon.com/blogs/aws/">
  AWS Blog</a> and
  <a target="_blank" href="https://twitter.com/search?q=%23aws&src=typd">
  #AWS Twitter hash-tag</a>

Yan Kurniawan

   * <a target="_blank" href="https://leanpub.com/ansible-for-aws">
   Ansible for AWS book</a> 280 pages for minimum $30 published on 2016-01-15 by Yan Kurniawan living in Sydney, Australia
  #ansible4aws.

* <a target="_blank" href="https://github.com/yankurniawan/ansible-for-aws">
    https://github.com/yankurniawan/ansible-for-aws</a>

J O'connner:

   * http://joconner.com/

Ryan Scott Brown @ryan_sb

   * https://serverlesscode.com/post/new-ssl-tls-cert-manager-acm/

Matt Wood, @mza, Product Strategy @ Amazon Web Services



## AWS Certifications #

* <a target="_blank" href="https://aws.amazon.com/certification/certified-sysops-admin-associate/">
  $150, 80-minute AWS Certified SysOps Administrator - Associate</a>

* <a target="_blank" href="https://aws.amazon.com/certification/certified-solutions-architect-associate/">
  $150, 80-minute AWS Certified Solutions Architect - Associate</a>

* <a target="_blank" href="https://aws.amazon.com/certification/certified-developer-associate/">
  $150, 80-minute AWS Certified Developer - Associate</a>

* <a target="_blank" href="https://aws.amazon.com/certification/certified-solutions-architect-professional/">
  $300, 170 minutes AWS Certified Solutions Architect - Professional</a>

* <a target="_blank" href="https://aws.amazon.com/certification/certified-devops-engineer-professional/">
  $300, 170 minutes AWS Certified DevOps Engineer - Professional</a>

<a target="_blank" href="https://www.amazon.com/Certified-Cloud-Practitioner-Practice-Questions-ebook/dp/B07BK1VJMX/">
   Practice exam dumps for AWS Certified Cloud Practitioner 2018</a>
   $5.99 or Kindle Unlimited.


## AWS Training Resources #

* <a target="_blank" href="https://www.cloudacademy.com/">
   CloudAcademy.com</a> provides hands-on lab instances with their tutorials.

* <a target="_blank" href="http://www.lynda.com/AWS-tutorials/Amazon-Web-Services-Essential-Training/">
   Lynda.com AWS tutorials</a>

* http://www.pluralsight.com/courses/aws-certified-sysops-admin-associate

* https://scotch.io/tutorials/deploying-a-mean-app-to-amazon-ec2-part-1

* https://scotch.io/tutorials/deploying-a-mean-app-to-amazon-ec2-part-2

* https://www.aws.training/home?courseid=8&language=en-US&src=web_en_course-developing&view=table

* <a target="_blank" href="https://quizlet.com/_2dk9qd/">
   Memorize AWS Acronyms as flash cards and games on Quizlet</a>


## More on Amazon #

This is one of a series on Amazon:

{% include aws_links.html %}
