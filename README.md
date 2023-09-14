# Test Cases and Thought Process

## UI Tests - SauceDemo

For the UI Tests, we had the following requirements:

1. Go to https://www.saucedemo.com/
2. Log in to the site. Verify that the items are sorted by Name ( A - Z ).
3. Change the sorting to Name ( Z - A).
4. Verify that the items are sorted correctly.

To do so, I opted in creating two main test cases to break this down and allow easier maintenability.
I also assumed that I didn't have to do a test specifically for the Login functionality, since it was not
specified in the project description. However, in a real world scenario this would be important given
the many options for login credentials.

The first test is `Validate The Default Alphabetical Inventory Sort`, in which I focused on
the checking the default sorting, as specified in requirement [2].

The second test is `Validate The Descending Alphabetical Inventory Sort`, where I focused on the
requirements [3] and [4], where I change the sorting used and validate that it is sorted as expected.

I did it like this to make it easier to have a suite testing both behaviors, since I believe that this
allows easier changes in the future focusing on smaller features.


## API Tests - PublicAPIs


For the API Tests, we had the following requirements:

1. Call https://api.publicapis.org/entries
2. Read the response, find all objects with property "Category: Authentication & Authorization"
3. Compare, count, and verify the number of objects where the property above
appears
4. Finally print found objects to console

Looking at the requirements, I also broke them down into two test cases. One of them to focus on simple validation
for the response, with I judged to be important in a real world scenario, and another test to actually
fulfill the requirements.

In my opinion it seemed a bit weird to `Compare, count, and verify` the number of objects with the category specified, since I missed context to make sure that the assertion would always make sense. For example, I saw we had 7 entries with the category above, but if I used this in a test and this changed for some reason to 8, the test would break, which didn't make much sense to me. Instead, I opted to verify if the list is empty, since I believe that a category disappearing completely would be a better indicative of something being wrong or a big change happening.

However, if we had a static amount of entries for this specific category that will never change, we could just
simply change this test case to have this validation, which would be a small change.

# Project
## Requirements
Python

Pip


## Setup

Install virtual env using `pip install virtualenv` and create a new virtual environment, using `py -m venv env`

You should also activate your environment, which for Windows can be done by using the command `.\env\Scripts\activate`, and then you can simply run `pip install -r requirements.txt` to install all dependencies required for the project.

You should also install a Web Driver, such as google web driver, following the steps on https://chromedriver.chromium.org/getting-started

You need to add this new web driver executable to your PATH, in Windows you can do so by moving the downloaded `chromedriver.exe` file
to the `%SystemRoot%` folder.


## Execution

To run the UI Tests we can use the following command:

```
robot SauceDemoTestCases.robot
```

For the API Tests, we can use a similar command for the suite:

```
robot PublicAPITestCases.robot
```

Finally, to run all tests you can use the following command:

```
robot .\
```