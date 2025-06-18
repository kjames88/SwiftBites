# Udacity Swift ND
## Swift Data Project
This project extends the starter code to add SwiftData management of persistent application data.  
The majority of the UI code is provided in the starter.  However, the following additions have been made:
* Ingredient "In Pantry" toggle
* Shopping List
  * Recipe scope
  * Shows a list of ingredients that are not "In Pantry"
  * Buy option to mark the ingredient "In Pantry" from the Shopping List view
* Prevent Ingredient deletion when used in a recipe
  * SwiftData allows a child object to be deleted while a parent holds a reference to the child
    * @Relationship does not appear to handle this case, per ChatGPT
    * Further, recipes would be damaged by removal of ingredients
  * An alert is generated if the delete operation fails
