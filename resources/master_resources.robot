*** Settings ***
# ********* CONFIGURATION *********
Resource     ${CURDIR}/../resources/config/config.robot

# ********* LIBRARIES *********
Library    Selenium2Library    run_on_failure=Nothing
Library    DateTime
Library    String
Library    BuiltIn


# ********* KEYWORDS *********
Resource    ${CURDIR}/../resources/keywords/ui/toDoList/toDoList.robot

# ********* LOCATORS *********
Resource     ${CURDIR}/../resources/locators/ui/toDoList/toDoList.robot