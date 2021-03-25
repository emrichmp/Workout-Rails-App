# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - User has_many routines
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - routines belongs_to User
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - has_many :commented_routines, through: :comments,
    - has_many :users, through: :comments
- [ ] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - Routine class validates that there is a "day" attribute
    - User class validates that the username is present and unique and the presence of a password attribute
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [X] Include signup
    - User can signup
- [X] Include login
    - User can login
- [X] Include logout
    - User can Log out
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
    - User can use omniauth to login using google
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
    - User can click on a routine and click on see all comments to get to '/routines/:id/comments'
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - User can click on a routine and click on add new comment to get to '/routine/:id/comments/new'
- [X] Include form display of validation errors (form URL e.g. /recipes/new)
    - If user gives faulty input on a form, it will pop up with an error

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [X] Views use helper methods if appropriate
    - helper methods are established in controllers and used in views
- [ ] Views use partials if appropriate