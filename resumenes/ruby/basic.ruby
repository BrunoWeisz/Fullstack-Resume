Object Methods
--------------

obj.object_id => a number representing the id of an object


Number Methods
--------------
* Converting integer - float

13.to_f => 13.0
13.9.to_i => 13

6.even?
6.odd?


Strings
-------
* String literals *
" " --> allows escape characters and interpolation
' ' --> does not

* Concatenate *
"Hola" + "Que" + "Tal"              --> not in-place 
"Hola" << "Que" << "Tal"            --> in-place
"Hola".concat("Que").concat("Tal")  --> in-place

* Substrings *
"hello"[0] => 'h'
"hello"[0..1] ==> 'he' (closed subset)
"hello"[a,b] ==> gets b elements starting from index a
"hello"[-1] ==> 'o'

* Escape Characters *
"\n" --> newline
"\t" --> tab
"\""
"\'"

* Interpolation *
name = 'Joaco'
puts "Hello, #{name}" => "Hello, Joaco"
puts 'Hello, #{name}' => 'Hello, #{name}'

* Methods *
str = "heLLo"

str.capitalize => 'HeLLo'
str.include?('lo') ==> true
str.upcase => 'HELLO'
str.downcase => 'hello'
str.empty? => false
str.length => 5
str.reverse => 'oLLeh'

"Hola Juan".split => ['Hola', 'Juan'] 
str.split("") => ['h', 'e', 'L', 'L', 'o']

"   hello  ".strip => 'hello'
'hello'.sub('l','j') => 'hejlo' (replaces the first appearance of the first argument with the second one)
'hello'.gsub('l','j') => 'hejjo' (replaces all appearances)
'hello'.insert(-1, " dude") => 'hello dude'
'hello'.delete('l') => 'heo'
"!".prepend('he', 'llo') => 'hello!'

* converting to string *
5.to_s => '5'
nil.to_s => ""
:aSymbol.to_s => 'aSymbol'

Symbols
-------
Symbols are stored in memory only once, therefore, there are no two equal symbols, if two symbols are equal, 
they are the same object.

Creation --> :aSymbolName

Booleans
--------
true 
false

nil
---
nil is the return value of any function that returns nothing explicitly

Variables
---------
* Assign * aVariableName = aValue

Variables reference a memory slot that stores a value.
When we assign a variable to another variable, a = 4, b = a, both variables (a & b) reference to a memory slot with the
value 4, but if we reasign a, for example, a = 7, then a == 7 and b still points to the same slot, so b == 4.
If we have a = "hi" and b = a, and we send a.upcase! (method that changes the value in place), we then have that 
a == b == "Hi", because both variables still reference the same value but that value has changed.

* Getting User Input *
var = gets --> gets a string but with the newline "\n" at the end
var = gets.chomp --> trims the carriage return

gets is a method that stops the excecution of the program until the user enters some input.

* Type of Variables *

-Constant variable: are variables written in CAPITAL_LETTERS, its value can change but it will throw a warning, they are 
            aviable throughout all application scopes and cannot be declared in method definitions.

    MY_CONSTANT = "String that should not change, like a key or an URL"

-Global variable: are variables declared with a $ (dollar sign) as prefix, are aviable throughout the entire app. Dont use.

    $my_global_variable = 42

-Class variable: are variables declared with a @@ as prefix, accessible by instances of the class and the class itself. 
                 Must be initialized at class level, outside any method definitions, and can be modified by class or 
                 method definitions. 

    @@my_class_variable = :dog

-Instance variable: are variables declared with a @ as prefix, aviable throughout the instance of the class.

    @my_instance_variable = 'cat'

-Local variable: are variables that obey scope boundries and are declared just with its name. 

    var = 2


Output to Console
-----------------

print aValue
puts aValue --> appends a newline at the end of the output
p aValue #(short for puts)
putc aCharacter
    
Conditional Logic
-----------------

Falsy values --> nil, false
Truthy values --> everything else

obs: the number 0 is a truthy value

* Conditional statements *

if statement
    some_code
elsif statement_2
    other_code
else 
    yet_another_code
end  


or... if there is only one line of code 

some_code if statement  


Boolean Logic
-------------

* Comparison Operators *
a == b --> compares by value
a != b
a > b
a < b
a >= b
a <= b
a.eql?(b) --> compares by value and type
a.equal?(b) --> compares the object_id
a <=> b (spaceship operator) --> -1: a<b, 0: a==b, 1: a>b

a.is_a?(ClassName) --> returns true if a is an instance of ClassName or instance of a subclass of ClassName
a.instance_of?(ClassName) --> returns true if a is an instance of ClassName 

* Logical Operators *
a && b  // and  --> if a is falsy, b is never evaluated
a || b  // or   --> if a is truthy, b is never evaluated 
!a      // not

obs: the english keywords have less precedence 
obs2: && and || return the result of the last expression to get evaluated.
        Therefore, we can use methods as a part of our logical chains.

We can use rubys lazyness to assign a variable if it hasnt: { var || var = 1 }. If var is nil, evaluates the right side.

* Case statements *
did_i_pass = case grade
                when "A" then "Yes"
                when "B" then "Yes"
                else "No"
            end

or if we have more complex logic in each case...

case grade
    when "A" 
        puts "Yes"
        some_code
    when "B" 
        puts "Yes"
        some_other_code
    else "No"
end

* Unless statements *
Is the same as an if statement, but executes the code when the condition evaluantes to falsy values.

* Ternary Operator *
var = condition ? value_if_true : value_if_false


Loops
-----

* loop *
#Is an infinite loop that only stops on break
loop do
    #do stuff
    break if break_condition
end

* while *
while condition do
    #do stuff
end

* until *
#Opposite to while, runs until the condition is matched
until condition do
    #do stuff
end

* ranges *
There is a Range class in ruby that lets us define an interval.

(1..5) --> inclusive range (1,2,3,4,5)
(1...5) --> exlusive range (1,2,3,4)
('a'...'e') --> also works with characters

* for *
for loops are used to iterate through a collection of information, for example a range or an array:

for i in 0..5
    p i
end
 
or...

for i in [0,1,2,3,4,5]
    p i
end


* Times loop *

5.times do
    #do stuff
end

or... if we want to acces the number currently iterating...

5.times do |iteratingNumber|
    p iteratingNumber
end

times is non inclusive.

* upto & downto *

5.upto(10) {|num| p num}
10.downto(5) {|num| p num}
obs: they are inclusive

* Do While *
begin
    some_code
end while condition

* next *
The next keyword inside a loop lets you skip the remaining portion of the iteration.


Arrays
------

Array literals: 
[1,2,3,4,"hola", :perro]
%w(hola chau gato) => ['hola', 'chau', 'gato']

Calling the Array.new method:
Array.new
Array.new(3) => [nil, nil, nil]
Array.new(3, 'h') => ['h', 'h', 'h'] Note: the second argument must be inmutable, 
                                        Array.new(4,[]) --> 4 references to the same array
Array.new(3) {some_expression} --> the expression gets evaluated for each index


Accessing elements:

arr = [1,2,3]
arr[0] => 1
arr[3] => nil
arr[-1] => 3
arr[-4] => nil

arr.first => 1
arr.first(2) => [1,2]
arr.last => 3
arr.last(2) => [2,3] (en orden, no a la inversa)

Modifying content
-----------------
arr = [1,2,3]

arr.push(4,5) => [1,2,3,4,5]         (modifies the array in place and returns the array)
arr << 4 => [1,2,3,4]                (modifies the array in place and returns the array)
arr.unshift(-1, 0) => [-1,0,1,2,3]   (add the elements at the begining)

arr.pop => 3        (deletes the last element in place and returns it)
arr.pop(2) => [2,3]
arr.shift(2) => [1,2] (deletes the elements from the begining)
arr.delete_at(index)  (deletes in-place the element of the array at the given index)
arr.delete(anElement) (deletes in-place the elements of the array equal to the given element)

Concatenation
-------------
arr = [1,2,3]
arr2 = [4,5,6]
arrc = arr + arr2 => [1,2,3,4,5,6] (Creates a copy of both arrays, and returns the concatenation)
arr.concat(arr2) = [1,2,3,4,5,6]   (Creates a copy of arr2 and concatenates it to arr)
arr += arr2 = [1,2,3,4,5,6]        (same as concat)

Substraction
------------
arr = [1,1,2,3,3,4,5]
arr2 = [1,3]
arr - arr2 => [2,4,5]  (Returns a copy of arr wihout any of the elements of arr2)

Intersection
------------
arr & arr2 --> copy of intersection of elements whithout repeated elements



Common Methods
--------------

arr.length || arr.size
arr.empty?
arr.reverse (returns a copy)
arr.include?(n)
arr.join(aString) --> joins the array as a string with aString as separator. No separator if no arguments.
arr.to_s --> transforms the array into a string in the format '[e, e, e, e]'
arr.flatten --> transforms a multi-dimensional array into a one-dimensional one (copy)
arr.sample --> picks a random element from the array
arr.compact --> removes nil values

arr.uniq --> returns a new array with no duplicate elements.
arr.uniq! --> deletes duplicate elements in-place.

arr.map { |anElement| anElement*2 }
arr.collect { |anElement| anElement*2 }
(map & collect are equivalent and return a copy)
arr.map! --> modifies the array in-place

arr.select {|e| e > 4} (returns a copy of the filtered array)

arr.each { |el| do_something_with_the_element }
arr.each_index { |id| do_something_with_the_index }
arr.each_with_index { |val, id| ... }

arr.sort --> returns a new sorted array
arr.product(anotherArr) --> returns the cartessian product of the arrays

* subarrays *
arr[0..1] => (closed subset)
arr[0...2] => (open to the right)
arr[0,2]   =>  gets 2 elements starting from index 0


Hashes
------
Hashes in ruby are like objects in javascript and dictionaries in python (recontra ish)

Hash literal: 
my_hash = {
    1 => 'hola',
    'perro' => :gato,
    'empty hash' => {}
}
Obs: the => operator is called 'hash rocket'

If we want to have symbols as keys, we can use this syntax: is more performant
my_hash = {
    dog: 'juan',
    cat: 'cata'
}

Using the Hash class:
my_hash = Hash.new
my_hash = Hash.new(default_value) => response value for every key that is not in the hash

* Accessing *
hash = {1 => 2}

hash[1] => 2
hash['perro'] => nil

hash.fetch(1) => 2
hash.fetch('perro') --> raises KeyError exception
hash.fetch('perro', default_value) => default_value

* Adding and changing data *
hash = {}
hash[1] = 'gato'
hash[1] = 'perro'

* Removing data *
hash.delete(key) => returns the value of the deleted key

* Common Methods *

h.empty?
h.keys -> array of keys
h.key?(aTargetKey)
h.values -> array of values
h.to_a 

h1.merge(h2) -> returns a new hash with key-values from both hashes (if superposition, h2 overrides)
h1.merge!(h2) -> replaces in-place h1 with key-values from both hashes (if superposition, h2 overrides)

* Iterating hashes *

hash.each {|key, value| 
    do_stuff
}

hash.select {|key, value| key == "Tincho"} (returns a new hash applying the filter)

* using hashes as optional parameters *

def greeting(name, options = {})
    if options.empty?
        puts name
    else
        puts name + options[:age] + options[:city]
    end
end

greeting("Bruno")
greeting("Bruno", {age: 21, city: "Buenos Aires"})
greeting("Bruno", age: 21, city: "Buenos Aires") --> We can use this syntax when a hash is the last argument.



Methods
-------

Convention to name instance methods:

Partial name: #name_of_method
Full name: #NameOfClass#name_of_method

There are built-in methods that Ruby makes globally accessible.
In ruby, parenthesis to call methods are ussually optional.
Implicit return: if there isnt an explicit return, the method returns the result of the last evaluated expression.

* Creating methods *

def method_name(parameter = default_argument_value)
    return parameter
end

method_name(argument)

* Method name conventions *
-start with lowercase
-snake case (separate words with '_')
-use only this symbols: _ ! ? = (last three only at the end of the name)
-dont begin with a number

* chaining methods *
string.reverse.join(" ").capitalize. ...

* predicate methods *
Predicate methods are methods which name ends with a ?. Its a convention for methods that return a boolean.

* bang methods *
Bang methods are methods which name ends with a !. Its a convention for methods that modify in-place the object over
which they are called.


Enumerables
-----------
Enumerables are a set of methods usefull to iterate through things that respond to some common patterns.

Another syntax is:
arr.method do |e|
    ...
end

arr.select{|e| return boolean_expr}
hash.select{|k,v| ...}
arr.reject{|e| return boolean_expr}
arr.each{|e| ...}  (returns the original array)
hash.each{|k,v| ...} or {|pair| ...} (returns the original hash)
arr.each_with_index{|e, idx| ...}  (returns the original array)
arr.map{|e| ...}
hash-arr.filter_map {|e| e.method if bool_expr} --> Just like a map, but filters nil values (map + compact)
arr.reduce{|accumulator, e| ... } (the initial value of the accumulator is the first value in the collection)
arr.reduce(initial_value){|accumulator, e| ...}
arr.find{|e| boolean_expr} --> Stops execution when finds an element that matches the condition and returns it
arr.tally_by {|e| expr(e)} --> creates a hash {result_of_expr => count_of_elements_that_resolve_in_that_value}
arr.include?(aValue)
arr.any? {|e| boolean_expr}  (verdadero si alguno satisface)
arr.all? {|e| boolean_expr}  (verdadero si todos satisfacen)
arr.none? {|e| boolean_expr} (verdadero si ninguno satisface)

methods that have its bang(!) version: map, select























Manipulating files
-------------
* Create a file *
aFile = File.new('path', 'mode')
    ...
aFile.close

* Open an (existing) file *
aFile = File.open('path', 'mode') do |aFile|
    ...
end

Modes:
r  --> read-only mode, places the pointer at the begining of the file
r+ --> read-write mode, places the pointer at the begining of the file
w  --> write-only mode, overwrite the file if the file exists, creates one if it doesnt
w+ --> read-write mode, overwrite the file if the file exists, creates one if it doesnt
a  --> write-only mode, places the pointer at the end of the file, appends 
a+ --> read-write mode, places the pointer at the end of the file, appends 

* Playing with the file *

line = aFile.gets --> reads a line from the file.
text = aFile.sysread(n) --> reads n characters from the file.
aFile.syswrite("asjdslkdf") --> writes into the file.