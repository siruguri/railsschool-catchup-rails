# Setting Up A (Nearly Free) EC2 instance

If you need a VPS, you can create an AWS account with a credit card -
the "AWS Free Usage Tier" is close enough to being free. Note though
that you will get only 30GB of storage, and will still have to pay if
you add more disk space. Also, your CPU time is limited to about 72
hours per month - you have to pay for any usage that exceeds that.

## Pre-requisites

This mini-guide assumes you already have familiarity with a command prompt, where you have installed SSL client tools, and can run the `ssh` command or something similar, like [`puTTY`](https://www.google.com/search?q=installing+putty).

## Instructions

* Once you've created your AWS account on Amazon, log in to the AWS Management Console and click on "EC2".
* click the blue "Launch Instance" button and complete the following steps:
  * Select the "Quick Launch Wizard" radio button
  * Create a new key pair and save the private key component in the `~/.ssh` directory on your local machine. It will be saved with a `.pem` extension, by default.
  * Choose the Launch Configuration labeled "Ubuntu Server 12.04.2 LTS" and select the "64-bit" radio button. (Note that these options might change in the future - they were available as of Feb 2014.)
* Click "Continue"
* Click "Launch".

You should get a message that your instance is launching.

If you get an error message that says "Each network interface requires either a subnet or a network interface ID," you've run into a minor AWS UI bug. In that case, close and open the Quick Launch Wizard, and repeat the above steps but don't click the "Launch" button. Instead, click "Edit Details" and then click "Save Details". Now when you click the "Launch" button it should work.

After your new instance comes up (usually takes a couple of minutes), find it in the instance list and look for its hostname. It will look something like `ec2-54-215-216-239.us-west-1.compute.amazonaws.com` (this is an example of an instance launched in the `us-west-1` zone; you might end up with a different default zone.)

Shell into your instance from your command prompt:

    $ ssh ubuntu@[your-machine-name] -i ~/.ssh/aws-personal-key.pem
    # Replace the key file name with whatever you named your key file.

Once you can shell into your instance, you are ready to play around with your own Unix instance. Note though that the instance doesn't come with Ruby or Rails - you still have to [install them](https://help.ubuntu.com/10.04/serverguide/ruby-on-rails.html).
