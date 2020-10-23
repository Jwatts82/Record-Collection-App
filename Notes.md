HTTP Verb           Route               Action

GET             /albums                   index
GET             /albums/:id               show
GET             /albums/:new              new
POST            /albums                   create
GET             /albums/:id/edit          edit
PUT/PATCH       /albums/:id               update
DELETE          /albums/:id               destroy

CRUD
create 
read
update
delete

MVC
Model logic - communicate with our database
View - displays the data to the client (browser)
Controller - interaction between the model and view - accepts web requests from the browser and communicates with the model to get the data to render the view to the page.