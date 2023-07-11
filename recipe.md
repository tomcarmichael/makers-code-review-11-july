I work for ACME TODO inc

We make CL todo apps.

Every time add or complete, want to see an updated list of todos with each todo on a new line.

If there are no todos return a message to indicate this.

`add todo` with an id attached

`done #{id}` and user would then no longer see that todo


---------

.add()

user input: `add to_do_name`

calls add(to_do_name)

Create a new ToDo object and add to ToDoList.to_dos

return value `todo added, ID #{id}`

-------

.mark_complete()

user input: `done #{id}` 

------------

.show_to_dos()

user input: `show todos` 

Iterate over todos array and print each on a newline (with ID?)
