*** Settings ***
Resource    ${CURDIR}/../../resources/master_resources.robot

Test Setup    toDoList.Go to abhigyank Website
Test Teardown    Close Browser

*** Variables ***
@{taskList}    TaskName1    TaskName2    TaskName3

*** Test Cases ***
TC_E2E_001
    [Documentation]    To verify that system able to add/complete/delete any tasks correctly
    [Tags]    e2e
    toDoList.Verify component on To Do list page

    # Add 3 tasks into to do list
    FOR    ${taskName}    IN    @{taskList}
        toDoList.Add new item    ${taskName}
    END

    # Complete 2 tasks
    toDoList.Open To do tasks tab
    toDoList.Complete item    1
    toDoList.Complete item    1

    # Delete the 3rd task from to do task page
    toDoList.Delete item on to do tasks    1    ${taskList}[2]

    # Complete 2 tasks
    toDoList.Open Completed tab
    toDoList.Verify completed item on completed tab    ${taskList}[0]
    toDoList.Verify completed item on completed tab    ${taskList}[1]

    # Delete 1st task
    toDoList.Delete item on completed tasks    1    ${taskList}[0]
    
    # Verify after delete completed tasks
    toDoList.Verify completed item on completed tab    ${taskList}[1]