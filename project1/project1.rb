require "rexml/document" # this is the xml library we'll be using

# open our XML file. File is a class from Ruby that represents
# files on your system. new is a method that creates a new instance
# of File. you give it one argument containing the path to the file
# you want to open. in our case, that's project1.xml. we don't need
# a directory in our path because the file is located in the same
# place as this script. we create a variable called project1File
# to refer to our opened file
project1File = File.new("project1.xml")

# tell REXML to create a Document instance from the XML.
# if you don't understand what that means, it's not important
# right now. the document is stored in a variable called
# xmlDocument
xmlDocument = REXML::Document.new project1File

# now we're going to do some real work. we're going to jump
# inside of the root element <fruits> of our XML file and
# iterate each of the <fruit> elements it contains.
# for each <fruit> element, we set REXML's representation of it
# in a temporary variable f, and then output a message describing it.
# to do that we use the built-in method attributes, which takes as
# an argument the name of one of that element's attributes and returns
# the value. so if there's an element like <foo bar="baz"/>, and we
# store the element foo, the result of the expression foo.attributes['bar']
# will be the string 'baz'. in this case, we want to use the name and the
# color attributes of <fruit>, which we output in a somewhat illegible
# puts statement (puts outputs a string and appends a newline at the end).
# all of the weird #{} stuff just tells Ruby "dude, I know I'm inside of
# of a string, but I want to write some more Ruby code and embed the result
# where I currently am, then go back to normal string behavior."

xmlDocument.elements.each("objects/fruits/fruit") { |f|
 puts "A delicious #{f.attributes['color']} #{f.attributes['name']} is in the #{f.attributes['location']}"
}

xmlDocument.elements.each("objects/furniture/furniture") { |f|
  puts "A #{f.attributes['color']} #{f.attributes['name']} manufactured by #{f.attributes['manufacturer']} is #{f.attributes['location']}"
}


# try running this script from the command line with "ruby project1.rb"
# and see if you get output similar to this:

# A delicious red apple
# A delicious orange orange
# A delicious greenish-brown pear

# as a next step, try playing around with the code above to make it output
# the location (location is an attribute of fruit, like name and color) as
# well. for example, this would be interesting to see:

# A delicious red apple is in the grocery bag
# A delicious orange orange is in the refrigerator
# A delicious greenish-brown pear is in the dog's mouth

# also don't be afraid to play around with the xml. add new attribute values,
# new elements, whatever you want. next time, we'll do something a bit harder
# so it pays to familiarize yourself with the basics
