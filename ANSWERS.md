# Q0: Why is this error being thrown?
This error is thrown because the pokemon model has not yet been made

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
The random pokemon are appearing from initially seeding the database then the home controller displaying the trainerless pokemon

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
This line creates a button with text "Throw a Pokeball!". When you click the button it sends a patch request to the capture method in pokemons_controller.rb. It calls this method with the current pokemons id as the parameter so that the controller can identify which pokemon was just captured and assign it to the current trainer.  

# Question 3: What would you name your own Pokemon?
Oski

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?


# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.
It sets the flash hash key error to the error message that arises from the form and displays a relevant message

# Give us feedback on the project and decal below!
I liked it, would have prefered less guidance and more freedom to interpret the project

# Extra credit: Link your Heroku deployed app
https://pokepalace.herokuapp.com