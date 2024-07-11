*** Variables ***
${lbl_toDoList}    //h1[text()='To Do List']

# ADD Item section
${div_addItem}    //a[text()='Add Item']
${input_newTask}    id=new-task
${btn_addTask}    //button/i[text()='add']

# TO-DO Tasks section
${div_toDo_toDoTask}    //a[text()='To-Do Tasks']
# ${btn_toDo_completeButton}    //input[@id='$row']
${lbl_toDo_taskName}    //span[@id='text-$row']
${span_toDo_taskName}    /span[text()='$name']
${btn_toDo_deleteTask}    //div[@id='todo']//button[@id='$row' and text()='Delete']

# COMPLETED section
${div_completed_completed}    //a[text()='Completed']
${span_completed_taskName}    //span[@class='mdl-list__item-primary-content' and text()='$name']
${btn_completed_deleteTask}    //div[@id='completed']//button[@id='$row' and text()='Delete']