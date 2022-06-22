Classes
-------

Definition syntax:
class ClassName
    @@class_instance = 0
    def initialize(param1, param2, ...)
        @local_var_1 = param1
        @local_var_2 = param2
        ...
    end

    def another_instance_method(...)
        some_code
    end

    def self.class_method
        @@class_instance

end

Usage:
instance = ClassName.new(arg1, arg2, ...)
instance2 = ClassName.new(arg1, arg2, ...)

instance.another_instance_method(...)
puts ClassName.@@class_method

Ruby NEEDS methods to access attributes, they cannot be accesed directly from outside the class.
A syntactic sugar for the following code...
def name; return @name; end;
... is ...
attr_reader :name
... and for this ...
def name=(newName); @name = newName; end;
... is ...
attr_writer :name
... and a shortcut for both ...
attr_accessor :name, :age, ...
... then we can access the name like ...
Class.new(aName).name
... and modify it ...
Class.new(aName).name = anotherName

* Setter methods *
An instance method named like method_name=(param) is a setter method because it ends with =.
A setter method allways return the value passed as argument.
Setter methods are called...
a.method_name = arg.
... not the usual way a.method_name(arg). 

If we want to call the setter or getter methods from an instance method, we should use the
'self' keyword, or else the compiler will thing we are defining local variables.
So, this is wrong...
def change_name newName; name = newName; end
...and this is right...
def change_name newName; self.name = newName; end

To call instance methods that are not setters, the 'self.' bit is optional.


Inheritance
-----------

class Dog < Animal 
    def method_to_be_overwritten(args)
        super(args)
    end
end

Overriding methods works as usual.
Calling super from a method in a subclass is like calling the method with the same name in its 
lookup chain.
If no arguments are passed to super, but the method that super references expects some arguments, 
then ruby will automatically forward the arguments of the original method to super. If super is
called with parenthesis 'super()' then it is called without arguments.
Ruby doesnt allow multiple inheritance.


Public, Private and Protected methods (Method Access Control)
-------------------------------------------------------------

Class ChurroDePuan
    public
    ...
    private
    ...
    protected
    ...
end

In ruby, methods are public by default.


Modules
-------

module MyModule
    COSA = 'soy una cosa :)'
end

Modules are like namespaces for separating objects and functions. They should not contain
variables, only constants. We can access those constants with the namespace (::) operator.
A module can also act as a container for methods, like...
module ModuleName
    def self.module_method
        ...
    end
end
... and then call them by ...
ModuleName::module_method or ModuleName.module_method

For the modules that are not present by default in the interpreter, we can 'require' them...
    require 'moduleName'
...and then use its functions and constants...
    ModuleName::CONSTANT/method/ClassName

If we want to use a module inside a class, we can 'include' it in the class...
    class MyClass; include ModuleName; end;
...and then use its functions and constants but without prefixing the Module...
    CONSTANT
Obs: this includes the module at instance level. If we want to include a module in a class 
at class level we must use...
    extend ModuleName

To include a module in a class is called a MixIn, and allows us to customize our classes.
The class will have access to the regular methods of the module.


* Modules vs Classes *
-A class can inherit from a single class but can MixIn many modules (called interface 
inheritance). 
-Subclassify usually refers to the relation 'is a' and MixIn modules refer to the relation
'has a'.
-Modules cannot be instantiated, they are used to namespacing and group methods.

Self
----

Using self inside an instance methods refers to the instance that receives the message. Using
self outside a method definition or inside a class method refers to the class itself.

* Ancestors *
Calling the .ancestors method in any object prints the ancestor chain. The ancestors chain
determines the lookup path of a method. Modules have priority over the parent class, and
last included modules have more priority.


Error Handling
--------------

raise "Exception specification" --> raises an exception.

begin 
    # code to execute
rescue ((StandardError => err))
    # code to handle errors
    # Optionally ((..)) we can specify the kind of error we want to handle 
    retry --> Execution goes back to the begin part.
else
    # code to execute when no errors
ensure
    # code to execute if whether there were errors or not
end

Exception is the root class for all possible errors:

Exception
    NoMemoryError
    ScriptError
        LoadError
        NotImplementedError
        SyntaxError
    SignalException
        Interrupt
    StandardError
        ArgumentError
        IOError
            EOFError
        IndexError
            StopIteration
        LocalJumpError
        NameError
            NoMethodError
        RangeError
            FloatDomainError
        RegexpError
        RuntimeError
        SecurityError
        SystemCallError
        SystemStackError
        ThreadError
        TypeError
        ZeroDivisionError
    SystemExit
    fatal 



I/O and Serialization
---------------------

The IO class in ruby wraps I/O streams. The constants $stdin, $stdout and $stderr are
instances of the IO class, which implements the 'puts' and 'gets' methods.

To create a IO object, we need to specify a file descriptor. Defaults are:
0 --> stdin
1 --> stdout
2 --> stderr 

If we want to create IOs to other streams, we have to asociate a file descriptor to the
file we want to interact with, via...
fd = IO.sysopen('route/to/file', mode) --> creates a file descriptor for the file
stream = IO.new(fd) --> creates the stream
stream.gets
stream.puts 'hola'
stream.close --> closes the stream

* Postioning in a stream *

stream.pos --> returns the current position of the file descriptor on the file.

When we read a line with stream.gets, we move forward the pointer.
We know that we reached the end of a file by calling stream.eof, returns a bool.
If we are currently in eof and call stream.gets, we will get a nil return.

stream.rewind --> puts the pointer back at the begining of the file. 
stream.read --> reads the whole file.

* Files *
File is a subclass of IO with some convenient built in functionalities.

Class methods:
File.new(filename, mode ='r') --> return a file
File.exist?("path/to/file")
File.absolute_path("./relatie/path")
File.atime('path/to/file') --> last accessed time
File.blockdev?('path')
File.charkdev?('path')

Instance methods:
file.atime
file.chmod(newBitPattern)
file.path
file.size --> in bytes

* Sockets *
Sockets inherit from IO. There are four principal kinds:
-TCPSocked
-UDPSocket
-UNIXSocket
-Socket

* StringIO *
Allows strings to behave like IOs. Usefull when we want to pass a string to a system that
consumes IO (for example, in tests). Does not inherit from IO.

StringIO.new('Hola mundo')

* Tempfile *
Doesnt inherit from IO, but implements the File interface and deals with temporary files.

* Serialization *
Serialization is the process by which an object or any data structure can be converted into
something that can be passed between computers as a stream of data. There are options:

- YAML: 




