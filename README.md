# InterviewSignUp
Sign up page for Sparo Labs interview challenge

# Description
This project is done completely programmatically in Swift(for most part) and Objective-C(only for SHA256 encryption for the password, since Swift isn't capable of accomplishing that task yet). No nibs or Storyboards are used. I did my best to make my page look exactly like the given page, including layout and color scheme.
This sign up page works for ALL iPhone/iPad/iPod touch screen resolutions in portrait mode. It works for iOS 8 as well as iOS 9.

# Functionality
This sign up form takes in user's first and last name, email, and password, validates email address and complexity of password (6-18 characters, containing at least 1 digit and 1 letter), and parses the data into a JSON string, which can then be sent to an outside API for further use. All passwords are salted and encrypted using SHA256 encryption to ensure security.