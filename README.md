# Warden Validator Status Notifier

![img_78](https://github.com/0ndrec/warden_ntfy/assets/30905073/091a8404-8e5a-42d6-a607-b5b953c052fb)


This script checks the status of a local Cosmos network validator. If the validator is found to be inactive or possibly jailed, it sends a notification through the ntfy.sh service, allowing you to quickly react and address any issues with your validator.
Prerequisites

    A Unix-like operating system with bash installed
    curl must be installed on your system
    Access to crontab for scheduling the script

**Step 1:** Check wardend and download script

    Check if your binaries are installed correctly. Check the paths.
    Download a script from github: https://raw.githubusercontent.com/0ndrec/warden_ntfy/main/status.sh
    
![carbon](https://github.com/0ndrec/warden_ntfy/assets/30905073/ee2eddc1-be8a-4728-ba9d-94664c3f4b0c)


**Step 2:** Configure ntfy.sh Notifications

    Create a topic on ntfy.sh by visiting the website and choosing a unique topic name.
    Replace (using the nano tool) <your-ntfy-topic> in the script with your actual ntfy.sh topic.

**Step 3:** Install the ntfy Mobile App (Optional)

To receive notifications directly on your phone, install the ntfy app:

    Website: https://ntfy.sh/
    For Android users, download the app from the Google Play Store.
    For iOS users, download the app from the App Store.

After installing, subscribe to the same topic you configured in the script.

**Step 4:** Make the Script Executable: To allow the script to run, you need to make it executable.
This can be done by changing the script's permissions with the chmod command. Open a terminal and run:

    chmod +x /path/to/status.sh

**Step 5:** Add Script to Crontab

To automatically check your validator's status at regular intervals, add the script to crontab:

    Open your user's crontab file by running crontab -e in your terminal.
    Add a new line specifying how often you want the script to run.
    For example, to run it every hour, add:


    0 * * * * /path/to/status.sh

    Save and close the crontab file. The script will now run at the interval you specified.

Usage

After setup, the script runs automatically based on the crontab schedule. If your validator becomes inactive or jailed, you will receive a notification via ntfy.sh.

For manual execution, run the script from the terminal:

    bash /path/to/status.sh

Support

Discord: https://discord.gg/Zrpyvje3

For support, please check the wardend and ntfy.sh documentation or contact the script maintainer.
