# Get Started
After cloning the repo, head to the `database` folder in which you will find a postgres db dump (in plain tar format), restore the db. 
Now navigate to `user_stories/settings.py` and ammend the `DATABASES` section accordingly with your postgresql instance details.
Note the db is owned by `postgres` and therefore the `DATABASES` values need to be ammended accordingly.

Open a terminal in the root folder and run the following:
* `python manage.py makemigrations`
* `python manage.py migrate`

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

# Github OAuth integration
To setup Github OAuth for you app, please head to github and create a new application [here](https://github.com/settings/applications/new). Once a new application has been created, proceed to generate a new client scecret for your app as well. Be sure to take note of the `Client ID` & the `Client Secret` you generated.
Now we need to set the ENV variables, so open command prompt, activate the virtual env and run `set SOCIAL_AUTH_GITHUB_KEY=<THE_GITHUB_CLIENT_ID>` and then `set SOCIAL_AUTH_GITHUB_SECRET=<THE_GITHUB_CLIENT_SECRETS>`

If you set the vairables properly then people should now be able to login via Github