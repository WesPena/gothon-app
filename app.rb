require 'sinatra'


#set :port, 8080
#set :static, true
#set :public_folder, "public"
#set :views, "views"

enable :sessions

before do
	# Or-Equals is a conditional assignment operator
	# If "death" is undefined, then make it equal to 0
	session['death'] ||= 0
	@death = session['death']
end

get '/' do 
	erb :index
end

get '/central_corridor/' do
	erb :central_corridor
end

post '/cc_choice/' do
	choice = params[:choice]
	if choice == "shoot"

		output = "<p>Quick on the draw you yank out your blaster and fire it at the Gothon.<br>"
		output << "His clown costume is flowing and moving around his body, which throws<br>"
		output << "off your aim. Your laser hits his costume but misses him entirely. This<br>"
		output << "completely ruins his brand new costume his mother bought him, which<br>"
		output << "makes him fly into an insane rage and blast you repeatedly in the face until<br>"
		output << "you are dead. Then he eats you.<br></p>"
		session['death'] += 1
		output << '<div class="container"><a href="/" class="btn">Start Over!</a></div>'

	elsif choice == "dodge" 

		output = "<p>Like a world class boxer you dodge, weave, slip and slide right<br>"
		output << "as the Gothon's blaster cranks a laser past your head.<br>"
		output << "In the middle of your artful dodge your foot slips and you<br>"
		output << "bang your head on the metal wall and pass out.<br>"
		output << "You wake up shortly after only to die as the Gothon stomps on<br>"
		output << "your head and eats you.<br></p>"
		session['death'] += 1
		output << '<div class="container"><a href="/" class="btn">Start Over!</a></div>'

	elsif choice == "tell a joke"

		output = '<p>Lucky for you they made you learn Gothon insults in the academy <br>'
		output << 'You tell the one Gothon joke you know: <br>'
		output << 'Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubh <br>'
		output << "The Gothon stops, tries not to laugh, then busts out laughing and can't move. <br>"
		output << "While he's laughing you run up and shoot him square in the head <br>"
		output << "putting him down, then jump through the Weapon Armory door.<br></p>"
		output << '<div class="container"><a href="/laser_weapon_armory/" class="btn">Next Page</a></div>'

	else

		output = '<div class="container"><a href="/central_corridor/" class="btn">Try Again!</a></div>'

	end
	erb :results, locals: { c: choice, o: output}
end

get '/laser_weapon_armory/' do
	erb :laser_weapon_armory
end

post '/lwa_choice/' do
	choice = params[:choice]
	session['guess'] ||= 0
	@guess = session['guess']
	if choice == "125" && @guess < 3

		output = "<p>BZZZZEDDD!<br></p>"
		output << "<p>The container clicks open and the seal breaks, letting gas out.<br>"
		output << "You grab the neutron bomb and run as fast as you can to the<br>"
		output << "bridge where you must place it in the right spot.<br></p>"
		output << '<div class="container"><a href="/the_bridge/" class="btn">Next Page</a></div>'

	elsif @guess >= 2	

		output = "<p>BZZZZEDDD!<br></p>"
		output << "<p> The lock buzzes one last time and then you hear a sickening <br>"
		output << "melting sound as the mechanism is fused together.<br>"
		output << "You decide to sit there, and finally the Gothons blow up the<br>"
		output << "ship from their ship and you die.<br></p>"
		session['death'] += 1
		output << '<div class="container"><a href="/" class="btn">Start Over!</a></div>'

	else

		output = "<p>BZZZZEDDD!<br></p>"
		session['guess'] += 1
		output << "<p>DOES NOT COMPUTE!<br></p>"
		output << '<div class="container"><a href="/laser_weapon_armory/" class="btn">Try Again</a></div>'

	end
	erb :results, locals: { c: choice, o: output}
end

get '/the_bridge/' do
	erb :the_bridge
end

post '/tb_choice/' do
	choice = params[:choice]
	if choice == "throw the bomb"

		output = "<p>In a panic you throw the bomb at the group of Gothons<br>"
		output << "and make a leap for the door.  Right as you drop it a<br>"
		output << "Gothon shoots you right in the back killing you.<br>"
		output << "As you die you see another Gothon frantically try to disarm<br>"
		output << "the bomb. You die knowing they will probably blow up when<br>"
		output << "it goes off.<br></p>"
		session['death'] += 1
		output << '<div class="container"><a href="/" class="btn">Start Over!</a></div>'

	elsif choice == "slowly place the bomb"

		output = "<p>You point your blaster at the bomb under your arm<br>"
		output << "and the Gothons put their hands up and start to sweat.<br>"
		output << "You inch backward to the door, open it, and then carefully<br>"
		output << "place the bomb on the floor, pointing your blaster at it.<br>"
		output << "You then jump back through the door, punch the close button<br>"
		output << "and blast the lock so the Gothons can't get out.<br>"
		output << "Now that the bomb is placed you run to the escape pod to<br>"
		output << "get off this tin can.<br></p>"
		output << '<div class="container"><a href="/escape_pod/" class="btn">Next Page</a></div>'
	else

		output = '<div class="container"><a href="/the_bridge/" class="btn">Try Again!</a></div>'

	end
	erb :results, locals: { c: choice, o: output}
end

get '/escape_pod/' do
	erb :escape_pod
end
get '/unlucky/' do
	erb :unlucky
end
get '/win/' do
	erb :win
end
