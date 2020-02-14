*** Settings ***
Library       SeleniumLibrary
Library       String

*** Variables ***
#Main
${URL}                                          https://the-internet.herokuapp.com/

#Login page
${USERNAME_VALID}                               tomsmith
${USERNAME_INVALID}                             qwerty
${PASSWORD_VALID}                               SuperSecretPassword!
${PASSWORD_INVALID}                             SuperSecret
${DEFAULT_TIMEOUT}                              20 seconds
${USERNAME_FLD}                                 id=username
${PASSWORD_FLD}                                 id=password
${SUBMIT_BTN}                                   xpath=//form[@id='login']//button[@type='submit']
${LOGIN_SUCCESS_TXT}                            xpath=//div[@class='flash success']
${LOGIN_ERROR}                                  xpath=//div[@class='flash error']

# Hovers page
${AVATAR_1}                                     xpath=(//div[@class='figure']//img[@alt='User Avatar'])[1]
${AVATAR_2}                                     xpath=(//div[@class='figure']//img[@alt='User Avatar'])[2]
${AVATAR_3}                                     xpath=(//div[@class='figure']//img[@alt='User Avatar'])[3]
${USERNAME_ONHOVER_1}                           xpath=//*[@id="content"]/div/div[1]/div/h5
${USERNAME_ONHOVER_2}                           xpath=//*[@id="content"]/div/div[2]/div/h5
${USERNAME_ONHOVER_3}                           xpath=//*[@id="content"]/div/div[3]/div/h5

# Tables page
${TABLE_LAST_NAME_HEADER_BTN}                   xpath=//table[@id='table2']//span[@class='last-name']
${TABLE2_LASTNAME_1}                            xpath=(//table[@id='table2']//td[@class='last-name'])[1]
${TABLE2_LASTNAME_2}                            xpath=(//table[@id='table2']//td[@class='last-name'])[2]
${TABLE2_LASTNAME_3}                            xpath=(//table[@id='table2']//td[@class='last-name'])[3]
${TABLE2_LASTNAME_4}                            xpath=(//table[@id='table2']//td[@class='last-name'])[4]

*** Keywords ***
#LOGIN PAGE
Open the login page
     Open Browser                               ${URL}login   firefox
     wait until element is visible              ${USERNAME_FLD}              ${DEFAULT_TIMEOUT}

Type valid username and password
     input text                                 ${USERNAME_FLD}             ${USERNAME_VALID}
     input text                                 ${PASSWORD_FLD}             ${PASSWORD_VALID}
     click element                              ${SUBMIT_BTN}

Check that the login was successful
     wait until element is visible              ${LOGIN_SUCCESS_TXT}        ${DEFAULT_TIMEOUT}
     wait until element is not visible          ${USERNAME_FLD}
     wait until page contains                   You logged into a secure area

Type invalid username and valid password
    input text                                 ${USERNAME_FLD}             ${USERNAME_INVALID}
    input text                                 ${PASSWORD_FLD}             ${PASSWORD_VALID}
    click element                              ${SUBMIT_BTN}

Check the error message when username is not valid
    wait until element is visible               ${LOGIN_ERROR}              ${DEFAULT_TIMEOUT}
    wait until page contains                    Your username is invalid
    Close Browser

Check the error message when password is not valid
    wait until element is visible               ${LOGIN_ERROR}              ${DEFAULT_TIMEOUT}
    wait until page contains                    Your password is invalid
    Close Browser

Type valid username and invalid password
    input text                                 ${USERNAME_FLD}             ${USERNAME_VALID}
    input text                                 ${PASSWORD_FLD}             ${PASSWORD_INVALID}
    click element                              ${SUBMIT_BTN}

#Hovers page
Open the hovers page
     Open Browser                               ${URL}hovers   firefox

Check if 3 avatar pictures are present
    wait until element is visible               ${AVATAR_1}                 ${DEFAULT_TIMEOUT}
    wait until element is visible               ${AVATAR_2}                 ${DEFAULT_TIMEOUT}
    wait until element is visible               ${AVATAR_3}                 ${DEFAULT_TIMEOUT}

Verify the username for the hover state of the avatar 1
    Mouse Over                                  ${AVATAR_1}
    wait until element is visible               ${USERNAME_ONHOVER_1}       ${DEFAULT_TIMEOUT}
    wait until page contains                    name: user1                 ${DEFAULT_TIMEOUT}

Verify the username for the hover state of the avatar 2
    Mouse Over                                  ${AVATAR_2}
    wait until element is visible               ${USERNAME_ONHOVER_2}       ${DEFAULT_TIMEOUT}
    wait until page contains                    name: user2

Verify the username for the hover state of the avatar 3
    Mouse Over                                  ${AVATAR_3}
    wait until element is visible               ${USERNAME_ONHOVER_3}       ${DEFAULT_TIMEOUT}
    wait until page contains                    name: user3
    Close Browser

# Tables page
Open the tables page
    Open Browser                               ${URL}tables   firefox

Click on the last name at the table number 2
    wait until element is visible               ${TABLE_LAST_NAME_HEADER_BTN}
    click element                               ${TABLE_LAST_NAME_HEADER_BTN}
    sleep     3 seconds

Check the ascending order
    wait until element is visible               ${TABLE2_LASTNAME_1}
    element text should be                      ${TABLE2_LASTNAME_1}        Bach
    element text should be                      ${TABLE2_LASTNAME_2}        Conway
    element text should be                      ${TABLE2_LASTNAME_3}        Doe
    element text should be                      ${TABLE2_LASTNAME_4}        Smith

Check the decending order
    wait until element is visible               ${TABLE2_LASTNAME_1}
    element text should be                      ${TABLE2_LASTNAME_1}        Smith
    element text should be                      ${TABLE2_LASTNAME_2}        Doe
    element text should be                      ${TABLE2_LASTNAME_3}        Conway
    element text should be                      ${TABLE2_LASTNAME_4}        Bach