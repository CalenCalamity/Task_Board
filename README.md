# User Stories

# Users
The user management project side of the app

# SMTP 
(All the terminal commands are ran from within a activated Vitual env)
For development purposes, head to `user_stories/user_stories/settings.py` and add/update the following fields at the bottom of the document:
* `EMAIL_HOST = "localhost"`
* `EMAIL_PORT = 65530` --> Choose any port on which you plan to run the dev server 
Once done with the changes, save the file and open a terminal in the root folder then proceed to run `python -m smtpd -n -c DebuggingServer localhost:<YOUR_CHOSEN_PORT>` where `YOUR_CHOSEN_PORT` is whichever port you choose to set in the `settings.py` file

To set up the SMTP server for actual use do the following. 
In the root app folder run `set EMAIL_HOST_USER=<your_email_host_user>` and then `set EMAIL_HOST_PASSWORD=<your_email_host_password>`.
Now head to `user_stories/user_stories/settings.py` and add/update the following fields accordingly:
* `EMAIL_HOST = <YOUR_SMTP_SERVER_HOST>`
* `EMAIL_PORT = <YOUR_SMTP_SERVER_PORT>`
* `EMAIL_HOST_USER = os.environ.get("EMAIL_HOST_USER")` --> This will reference the environment variable you set with the previous command
* `EMAIL_HOST_PASSWORD = os.environ.get("EMAIL_HOST_PASSWORD")`
* `EMAIL_USE_TLS = True`

