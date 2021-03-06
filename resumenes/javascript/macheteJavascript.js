console.log("log")
alert("Mensaje de error")
let var1 = 8
let var2 = "hola", var3 = 7;
typeof 4
let var4 = 3945723490857234908273409682376n; <-- big int

eval() function
---------------
eval(aString) --> evaluates aString as if it were code.


null
undefined <-- means "value not assigned"


good practices:
-capital characters for constants.

Arithmetic operators:
+
-
*
** (exponentiation)
/
% (mod)
++ (inc)
-- (dec)

Numbers are allways 64-bit floating point numbers.
Nan <-- Not a Number // isNaN(NaN) == true 
	every operation that involves Nan results in NaN
Infinity / -Infinity <-- generated by exeeding max/min number or a zero division.

In all Arithmetic operations (except adding two strings), js will try to turn strings into numbers.

------------Strings------------
*Escaping characters in a string: const frase = 'it\'s a lot of fun' <-- use a backslash
*Template literals: `este es un string con el numero 7 al final ${var2}` <-- use a backtick	
					`${var2}${var2}`
					template literals allow a string to have multiple lines and to be defined like so.
*Concatenate using + : "hola me" + " llamo Bruno " + var2 		

*Mixing stings and numbers: "holanda" + 3 == "holanda3"
*Convert a string into a Number: Number("456") == 456
*Convert a number into a string: variableNumerica.toString(base_opcional) 

String Methods and properties
-----------------------------
let txt = "este es un string";

Longitud: 
	-txt.length

Extracting parts:
	-txt.slice(begin, end) -> returns txt[begin, end)
	 txt.slice(begin) -> return txt[begin, txt.length]
	 can take negative parameters

	-txt.substring() --> same as slice, but can not take negativa parameters

	-txt.substr(begin, sizeOfExtractedPart)

Replacing content:
	-txt.replace("este", "estanio") --> returns "estanio es un string", does not change the string in-place, replaces the first match.
	 txt.replace(/este/g, "estanio") --> replaces all matches

Upper and Lower cases:
	-txt.toUpperCase()
	-txt.toLowerCase()

Concatenate:
	-txt.concat(" bueno ", "por suerte") --> returns "este es un string bueno por suerte"

Trim:
	-("    "+txt+"   ").trim --> returns "este es un string", cuts the whitespaces from the end and the beginig

Access:
	-txt[5] --> it is read only! 

Convert string into array:
	-txt.split(aString) --> splits the string into an array of strings, separating by aString
	-txt.split() --> all string in index 0
	-txt.split("") --> array of characters

-------------CONDITIONALS----------------------
if (boolean_condition){

} else if (boolean_condition_2) {

} else {

}

Ternary operator: (boolean_condition) ? codeIfTrue : codeIfFalse

-------------FUNCTIONS------------------
*function declaration:
function myFunc(parameter_1, parameter_2 = "Juan", parameter_n){ --> parameter_2 is optional, it has a default value
	...
}
This functions can be called before its declaration, but are only visible inside the block code they are declarated 

*Annonymous function: have no name
This way of creating a function is called 'function expression'
myFunc = function(){
	...
};
This functions are created at the moment of the assignement

*Arrow functions:
Instead of using 'function(parameter_1){}' you can use '(parameter_1) => {}'

Note: if the function only occupies one line, you can omit the curly brackets
	                                          you can omit the return value

Note: if an argument is not passed to a function, its value becomes undefined.

Terminology:
	-parameters: items listed in a function declaration.
	-arguments: actual values we pass to the function.

----------------
Callback Functions ----> functions passed to another function as an argument
f(condition, option_1, option_2){
	if (condition) option_1()
	else option_2();
} --> option_2 and option_1 ar called "callback functions"

confirm("someString") --> raises a sign asking you to accept or cancel

------------GETTING USER INPUT---------------
let name = window.prompt("Dame tu nombre") --> as in the 'alert()' format

*for number imput: parseInt(...)

---------------ERRORS---------------

An error is a built-in type in javascript, consisting of a type and a message.

Common type of errors:
	-ReferenceError --> reference to a variable that is not declared in the current scope.
	-SyntaxError --> grammatically incorrect code
	-TypeError --> argument passed to a function is incompatible with the type expected
				   attempt to modify a value that cannot be changed

---------------ARRAYS----------------
Methods
-------

.length
.sort()
.forEach(f) --> f is a function that takes only one argument: each element of the array will take that argument's place in order  '
.push() 
.pop() --> removes last element and returns its value
.isArray()
.instanceOf(Array)
.toString() --> comma-separated
.join(separator) 
.shift() --> removes first element
.unshift(element) --> adds element to the begining, returns new array length
.concat(otherArray, ..., otherArray_n) --> returns a new array, doesnt change the others
.slice(n)
.includes(element)

.some(f(e)->bool)
.every(f(e)->bool)
.find(f(e)->b)
.findIndex(f(e)->bool)

----------LOOPS-----------
for(let i = o; i < 67; i++){}
for(const 'element' of 'array'){}
[].forEach(f)
[].map(f) --> f is a function that takes one argument (the element) and returns another one
[].filter(f) --> f is a function that takes one argument (the element) and returns a boolean
while(){}
do{}while()

-----------SET TIMEOUT------------
let timeoutObject = setTimeout(function, numberOfMilliseconds) --> excecute the function after some milliseconds.
clearTimeout(timeoutObject) --> cancells the execution of the function.

let intervalObject = setInterval(function, intervalNumber)
clearInterval(intervalObject)

||------------MANIPULATING-THE-DOM----------------||
document.documentElement --> Root of the DOM, refers to the <html></html> element.    /
document.head
document.body

Each node object has a .nodeType property with a code nuber that represent its type
				

--Moving through the tree--
node.childNodes --> nodeList
nocd.children --> nodeList only containing elements, not every kind of node
node.firstChild
node.lastChild
node.previousSibling
node.nextSibling
node.parentNode

-Other ways of accessing nodes- --> these are 'live nodes', if you change them, you will see the change happen in the screen.
document.getElementByTagName("a")[index]. 
document.getElementById("idOfElement")
document.getElementByClassName("className")
	--> every node has these properties.

--Accessing the nodes in the DOM tree--

*Using CSS selectors:
let a = document.querySelector('.class' / '#container' / ...) --> first node that matches
let lista = document.querySelectorAll('.class' / '#container' / ...) --> all nodes that match, in the form of a nodelist (Array.from(..) to convert)

*Using relational selectors:
a.firstElementChild
a.previousElementSibling

--Creating Nodes--
document.createElement(tagName, [options]) --> [options] optional parameters
document.createTextNode("textForTheNode")

--Append Nodes--
parentNode.appendChild(childNode) --> appends the node as the last child
parentNode.insertBefore(childNode, referenceNode) --> appends childNode as a child of parentNode before referenceNode
  --> Each node can be in one place at a time, so putting an element in one place will cause that element to be removed from its current position

--Remove Nodes--
parentNode.removeChild(childNode) --> returns a reference to the child node removed from the DOM.
parentNode.replaceChild(newNode, childNodeToBeReplaced)

--Adding inline style--
node.style.color = "blue"
		   backgroundColor
		   border
		   width
		   height
node.style.cssText = 'color: blue; background...' --> adds many css rules
node.setAttribute('style', 'color:blue; ...') --> adds many css rules (or any other HTML attribute)

--working with attributes--
node.setAttribute(attributeName, attributeContent)
	ej: div.setAttribute("id", "newID")
node.getAttribute(attributeName)
node.removeAttribute(attributeName)

--working with classes--
node.classList.add('className')
node.classList.remove('className')
node.classList.toggle('active') --> if the class exists, it is removed. If it doesnt exist, it is created.

--Adding text content--
div.textContent(aString) = 'new content' --> creates a text node containing aString and inserts it in the node.

--Adding HTML content--
div.innerHTML = '<span> Buenas buenas... </span>'

----ADVANCED QUERY SELECTORS---
document.querySelector('.className[attribute = "valueOfAttribute"]')
document.querySelector('div[attribute = "valueOfAttribute"]')

------------EVENTS-----------
--window--
The window is a built-in object provided by the browser, represents the browser window that contains the document.
Its common to call the window.addEventListener(...) 

--Ways to add events--

1) In the HTML file, inline. Attach a function directly into the html element.

<button onclick = "alert('cliqueado')" > Click Me! </button>		/				

2) In the javascript code, attack define the .onclick property of the object and assign it a function.

In the HTML file, add a hook to the element (a way to acces it)
In the javascript file: 
	node.onclick = () => alert("hola")

3) 

node.addEventListener('nameOfEvent', function)
node.removeEventListener('nameOfEvent', function)

-Posible events-
*click
*dblclick
*keypress --> user presses a key
*keydown --> user is pressing a key
*keyup --> user releases a key
*focus --> an element gets focus
*blur --> an element loses focus. (It is not propagated to its parents!!!)
*change --> the content of an element has changed
*contextmenu --> right click on the element
*drag --> element being dragged
*error --> when an error occurs loading an external file
*input --> an element gets user input
... many many more



In methods 2) and 3), the callback functions recieves one parameter. This parameter is the event itself.

e.target --> DOM node that was targeted 

--warning--
node.addEventListener("event", f(arg_1, ..., arg_n)) --> when we pass arguments this way, the function is called imediatly, WRONG.

--Prevent default behaviour--
Some events have a default behaviour in a browser, but if we attach a handler to the event, this handler will be called before its default
behaviour. If we want to avoid the default behaviour, we can call ev.preventDefault() on the event object.

----Event Capture, Propagation and Bubbling----
When, for example, we click over a div element, we might be clicking over many chained elements thay end with the element we want to click.
The browser goes through every element you are clicking, from top to bottom and saves them. Then, it starts to 'bubble up' when it comes to
excecute the events binded to the click on the elements, from the bottom to the top.

*The events have a function e.stopPropagation(), that stops this bubbling up.

*The function addEventListener has a third argument, that can be an options object, containing certain properties in that matter. For example:
	-capture: false --> the browser excecutes the callback functions binded to the events as it saves them in the stack.
	-once: true --> the EventListener unbinds itself after the first call.

----DESTRUCTING ASSIGNMENT----

---Arrays---
let [firstName, lastName] = "Jhon Smith".split(" ");
let [a, ,b] = [1,2,3,4,5] ==> [1,3]
let [obj.a, obj.b] = [1,2]

-many values-
let [a,b,...rest] = [1,2,3,4,5] ==> a == 1, b == 2, rest == [3,4,5]

-missing values-
let [a, b] = [1] ==> b == undefined
let [a, b=2] = [1] ==> a == 1, b == 2  

---Objects---
The left side object contains an object-like pattern for the desired properties.
let {var1, var2} = {var1: 1, var2: 2} // the order does not matter

-changing the names of the properties-
let {var1: variable1} = {var1: 1} // variable1 == 1 

-default values-
let {var1 = 1, var2} = {var2: 1} // default values can be any expression

-many values-
let {var1, ...rest} = {var1: 1, var2: 2, var3: 3} // rest == {var2: 2, var3: 3}

-syntax issue-
let a,b,c;
{a,b,c} = {a:1, b:2, c:3} //doesn't work becausa js assumes {} outside an expression is a code block. The solution:
({a,b,c} = {a:1, b:2, c:3})

----------OBJECTS-----------
*delete properties: delete obj.prop
*Acces properties with a string: obj["propertyName"]
*Use brackets to define a propertie name in an literal: obj = {[propertieNameInVariable]: "hola"}

*"nameOfKey" in object --> boolean

*for (let key in object){...} --> properties are listed in creation order, except for integer properties that go in order.

--Object constructors--
# Definition #
function Object(arg1, arg2){
	this.arg1 = arg1;
	this.arg2 = arg2;
}
# Use #
let obj = new Object("hola", "chau");

----Object prototypes----
*Literal objects have Object.prototype as its prototype.
*Constructor functions have Function.prototype --> Object.prototype
*Objects created with constructor functions (new Fun()) have Fun.prototype --> Object.prototype


If we create an object (obj) with a contructor Fun(), each property will be copied into obj. Instead, if we set a property into Fun.prototype,
there is only one copy of the property.

--Methods--
Obje
Object.getPrototypeOf(obj)
Object.setPrototypeOf(objToSet, objPrototype)
let newObj = Object.assign(obj1, obj2) --> copy the properties and values from obj2 to obj1
let newObj = create(obj2) --> creates an empty newObj with obj2 as its prototype

--Factory function pattern--
Example:
function personFactory(name, age){
	return {
		name: name;
		age: age;
	}
}
let juan = personFactory("Juan", 24);

----Scope and Context----
Scope -> variable access (what variables I have access to)
			-> current context of the code
A scope can be locally or globally defined. Functions create local scopes, not loops or conditional structures.

When we create a function, inside a function we are inside a child scope. If we define functions inside functions, for example...
//scope 1
let func1 = function(){
	//scope 2
	let name = "a";
	let func2 = function(){
		//scope 3
	}
}
... we can access scope 2 from scope 3. This is called lexical or static scope.

Scope conflict: two anidated scopes have a variable defined with the same name. Child scope wins the access. In the case with a function,
	we can acces a variable named 'a' in both scopes throug 'a' and 'window.a'.

context -> the value of 'this' pseudovariable
	The root scope or global scope is generally the 'window' object

--Changing the scope--
*foo.call(scope, arg1, arg2, ...) --> calls the function 'foo' but binds the argument object as 'this' inside the function.
*foo.apply(scope, [arg1, arg2, ...]) --> same effect, the difference is the way arguments are passed.
*foo.bind(scope, arg1, arg2, ...) --> binds the scope and the arguments, but doesn't call the function    '

--Closure--
Functions retain its scope, doesn't matter where they are.' Closures allow us to create private variables and functions.

----MODULE PATTERN----
It is almost the same as a factory, but the module pattern wraps the factory inside a IIFE (Immediately Invoked Function Expression)

Basic example:
let myModule = (function(){
	'use strict'; // good practice when using this pattern
	// All functions and variables are scoped to this function
	let _privateProperty = 3;
	let publicProperty = 4;

	function _privateMethod(){
		console.log(_privateProperty);
	}

	function anotherPublicMethod(){
		//...
	}

	return {
		publicMethod: function(){
			_privateMethod();
		},
		anotherPublicMethod,
		publicProperty
	}

})();

myModule.publicMethod();

--Module with dependencies--

let myModule = (function(dep){
	//...
})(dependency)

--------CLASSES----------
--class declaration--
class NameOfClass {
	prop = value;
	constructor(arg1){ // method called automatically
		this.val1 = arg1;
	}
	methodName(){...};
	get something(){...};
	get something(){...};
}

--unnamed class expression--
let NameOfClass = class {
	...
}

--named class expression--
let NameOfVariableClass = class NameOfClass{
	...
}

let obj = new NameOfClass(arg);

Note: classes must be defined before its use in the code.
Note: The body of a class is executed in strict mode.
Note: There must be no commas separating class methods.
Note: class declarations have a name, only visible inside the class.

Really happening: 'class Name{}' creates a constructor function named 'Name' and puts the constructor method as its body. All class methods are 
									stored in Name.prototype
