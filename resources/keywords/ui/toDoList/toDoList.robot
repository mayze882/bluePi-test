# Robotframework Keywords for Order List
# Created By: Sivaporn Ari.
# Created Date: 31/07/2019  DD/MM/YYYY
# Modified By: Sivaporn Ari.
# Last Modified Date: 02/08/2019

*** Settings ***
Resource    ${CURDIR}/../../../master_resources.robot

*** Keywords ***
Go to abhigyank Website
    Open Browser    ${TO_DO_LIST_URL}    ${DEFAULT_BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${lbl_toDoList}

Verify component on To Do list page
    Element Text Should Be    ${lbl_toDoList}    TO DO LIST
	Element Text Should Be    ${div_addItem}    ADD ITEM
	Element Text Should Be    ${div_toDo_toDoTask}    TO-DO TASKS
	Element Text Should Be    ${div_completed_completed}    COMPLETED

Generate random item name
    ${currentDateTime} =    Get Current Date
    ${dateTime} =    Convert Date     ${currentDateTime}    result_format=%Y%m%d-%H%M%S
    ${taskName}    Catenate    TestItem-${dateTime}
    RETURN    ${taskName}

Add new item
    [Arguments]    ${itemName}
	Input Text    ${input_newTask}    ${itemName}
    Click Element    ${btn_addTask}

Open To do tasks tab
    Click Element    ${div_toDo_toDoTask}

Verify added item on To do tasks tab
    [Arguments]    ${row}    ${itemName}
    ${locator} =    Replace String    ${lbl_toDo_taskName}    $row    ${row}
    Element Text Should Be    ${locator}    ${itemName}

Delete item on to do tasks
    [Arguments]    ${row}    ${taskName}
    ${locator} =    Replace String    ${btn_toDo_deleteTask}    $row    ${row}
    Click Element    ${locator}
    ${locator2} =    Replace String    ${span_toDo_taskName}    $name    ${taskName}
    Element Should Not Be Visible    ${locator2}

Complete item
    [Arguments]    ${row}
    ${locator} =    Replace String    ${lbl_toDo_taskName}    $row    ${row}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Open Completed tab
    Click Element    ${div_completed_completed}

Verify completed item on completed tab
    [Arguments]    ${taskName}
    ${locator} =    Replace String    ${span_completed_taskName}    $name    ${taskName}
    Element Text Should Be    ${locator}    done${taskName}

Delete item on completed tasks
    [Arguments]    ${row}    ${taskName}
    ${locator} =    Replace String    ${btn_completed_deleteTask}    $row    ${row}
    Click Element    ${locator}
    ${locator2} =    Replace String    ${span_completed_taskName}    $name    ${taskName}
    Element Should Not Be Visible    ${locator2}
