*** Settings ***
Resource    ${CURDIR}/../../resources/master_resources.robot

Test Setup    toDoList.Go to abhigyank Website
Test Teardown    Close Browser

*** Variables ***

*** Test Cases ***
TC_REG_001
    [Documentation]    To verify the component on to-do list page
    [Tags]    Regression
    toDoList.Verify component on To Do list page

TC_REG_002
    [Documentation]    To verify adding new item
    [Tags]    Regression
    ${taskName} =    toDoList.Generate random item name
    toDoList.Add new item    ${taskName}
    toDoList.Open To do tasks tab
    toDoList.Verify added item on To do tasks tab    1    ${taskName}

TC_REG_003
    [Documentation]    To verify deleting item on to do task page
    [Tags]    Regression
    ${taskName} =    toDoList.Generate random item name
    toDoList.Add new item    ${taskName}
    toDoList.Open To do tasks tab
    toDoList.Verify added item on To do tasks tab    1    ${taskName}
    toDoList.Delete item on to do tasks    1    ${taskName}

TC_REG_004
    [Documentation]    To verify completing tasks
    [Tags]    Regression
    ${taskName} =    toDoList.Generate random item name
    toDoList.Add new item    ${taskName}
    toDoList.Open To do tasks tab
    toDoList.Complete item    1
    toDoList.Open Completed tab
    toDoList.Verify completed item on completed tab    ${taskName}

TC_REG_005
    [Documentation]    To verify deleting the completed tasks
    [Tags]    Regression
    ${taskName} =    toDoList.Generate random item name
    toDoList.Add new item    ${taskName}
    toDoList.Open To do tasks tab
    toDoList.Complete item    1
    toDoList.Open Completed tab
    toDoList.Verify completed item on completed tab    ${taskName}
    toDoList.Delete item on completed tasks    1    ${taskName}
