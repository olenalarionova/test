*** Settings ***
Library         SeleniumLibrary
Library         String
Resource       ../Resources/resource.robot

*** Test Cases ***

001 - scenario Login Success
    Open the login page
    Type valid username and password
    Check that the login was successful

002 - scenario Login failure 1
    Open the login page
    Type invalid username and valid password
    Check the error message when username is not valid

003 - scenario Login failure 2
    Open the login page
    Type valid username and invalid password
    Check the error message when password is not valid

004 - scenario Hovers
    Open the hovers page
    Check if 3 avatar pictures are present
    Verify the username for the hover state of the avatar 1
    Verify the username for the hover state of the avatar 2
    Verify the username for the hover state of the avatar 3

005 - scenario sortable data table
    Open the tables page
    Click on the last name at the table number 2
    Check the ascending order
    Click on the last name at the table number 2
    Check the decending order