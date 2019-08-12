# CookingCalculator
 An App that will calculate material, cooking order, and also popup instructions upon next step!

## Stories
###  Recipe data model [json]
- recipe format
- local storage
- recipe referencing should be possible. which means recipe should have a unique recipe id
- a new recipe which is a variation of another recipe will belong to the same group
- recipe should have cooking process, which should be represented by steps with time period, start instruction, end instruction
- since recipe might come in different langauges, they shoulbe belong to the same class. Which means class name itself should cover multiple language

### Edit recipe [UI]
- recipe owner can rearrange step order
- recipe owner can edit instruction

### Store recipe [Coredata]
- save recipe
- update recipe
- read recipe

### Create recipe [UI]


### Search for pre-built ingredients [Local Coredata]


### Add pre-built ingredients to current recipe
- If a pre-built ingredient is present, ask if the user want to roll-out the ingredients cooking instruction

### Cooking Instruction Scenario
- current step, as a title; next step, as a subtitle
- if time-sensetive, add it to a list of crucial steps, color: red
- if time-sensetive, should have start / end instruction
- tap to complete current step
- hot-fix button. use it to pause, then reset, resuem, restart
- cancel button, use it to stop the whole project

### Multi-course cooking instruction Scenerio


### Import / Download recipe [Remote]
- Backend support

### Search for pre-built ingredients [Remote]
- Backend support


