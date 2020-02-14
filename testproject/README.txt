
SETUP THE FRAMEWORK

    1. Make sure the python and pip are set up by
    $ python -- version
    $ pip --version

    2. Install robotframework with pip
    $ pip install robotframework

    3. Install selenium library
    $ pip install --upgrade robotframework-seleniumlibrary

    4. Install chrome and firefox drivers
    $ pip install chromedriver-py
    $ pip install geckodriver

    5. Install IDE - Pycharm - Community version
    https://www.jetbrains.com/pycharm/download/#section=mac

THE STRUCTURE OF THE FRAMEWORK

    There are 3 repositories
     - Resources
     - Results
     - Tests

     In RESOURCES there is resource.robot file which contains all the variables and keywords sorted by pages
     In TESTS there is project.robot file, which contain all the test cases
     The RESULTS contains the file output.xml which contains the status of the tests (FAIL, PASS)

TO RUN THE TESTS YOU HAVE TO

    If you want to run all the tests use the command:
    $ robot -d results tests/project.robot

    If you want to run just one of them, just change the name of the test:
    $ robot -d results -t 001 - scenario Login Success tests/project.robot

