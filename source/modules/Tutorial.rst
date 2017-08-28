===============
Python Tutorial
===============

This is a tutorial to get you started. Not a lot of explanation,
but enough to get you going with writing basic python code.

This tutorial uses exclusively Python3.

You may want to also check out some other tutorial options:

* **Jessica McKeller's beginning tutorial** (Video)
  https://www.youtube.com/watch?v=MirG-vJOg04

* **The Python Tutorial**
  (https://docs.python.org/3/tutorial/): This is the
  official tutorial from the Python website. No more authoritative source is
  available.

* **Code Academy Python Track**
  (http://www.codecademy.com/tracks/python): Often
  cited as a great resource, this site offers an entertaining and engaging
  approach and in-browser work.

* **Learn Python the Hard Way**
  (http://learnpythonthehardway.org/book/): Solid and gradual.
  This course offers a great foundation for folks who have never
  programmed in any language before. It is, however, only Python2,
  and pretty opinionated about that. But for the most part, you can
  simply add paretheses to ``print()`` and you can get pretty far.

Running Your Code
=================

There are a number of ways to run python code:

- At the interpreter, often referred to as a REPL (Read, Evaluate, Print Loop)
- At an enhanced interpreter such as iPython
- In a browser-based interactive system such as the Jupyter Notebook
- From and IDE, such as IDLE or PyCharm
- Calling python from the command line to run a file.

While working with an interactive interpreter can be an excellent way to explore Python (and I highly recommend it), For this tutorial, to get you used to "real" production development, you will write, edit, and save your code in a programmer's text editor, and run it from the command line.

An Programmer's Text Editor
---------------------------

A bit here about an editor, and recommendations on selecting one, with pointers to documentation about editor configuration.

The Python Interpreter
----------------------

Python is a "byte compiled, interpreted" language. What this means to you is that you need a Python interpreter to run your Python code. It also means that that is all you need -- write some code, and run it with Python. That's it.

There are a few Python interpreters (or run-times) available:

- cPython
- PyPy
- Jython
- Iron Python
- MicroPython

These each have their own special uses for interactive the the Java VM or CLR, or running on micro controllers. But most production Python is run with the cPython interpreter, and most people mean cPython when they say "Python".

[link to setting up your environment here]

For this tutorial, you will need cPython version 3.6, installed and running so that when you type "python" at your command line, it starts up:




.. code-block:: bash

  MacBook-Pro:~ Chris$ python
  Python 3.6.2 (v3.6.2:5fd33b5926, Jul 16 2017, 20:11:06)
  [GCC 4.2.1 (Apple Inc. build 5666) (dot 3)] on darwin
  Type "help", "copyright", "credits" or "license" for more information.
  >>>

Your result may be slightly different, but it should say Python 3.6. *something* there at the top, and give you the command prompt (``>>>``) at the end.

You can get out of it by typing ctrl+D (on OS_X and Linux) or ctrl+Z (On Windows), or typing ``exit()`` and hitting <return>.

Your first "program"
--------------------

Create your first program by typing this into your text editor::

    print("this worked!")

Type it exactly as above, with no extra space at the beginning, and no other characters.

Save the file as "first.py". Make sure to save it somewhere that makes sense, maybe a directory you create for this purpose, called "tutorial".

Start up the command line ("Terminal" on OS-X, "Command Prompt" on Windows), and "Navigate" to the directory where you just saved that file::

  cd tutorial

Now run your little program, by typing ``python first.py`` and hitting <return>. You should get something like this:

.. code-block:: bash

  MacBook-Pro:tutorial Chris$ python first.py
  this worked!
  MacBook-Pro:tutorial Chris$

If this is *NOT* what you got then something went wrong. Some things to check:

 - Did you save the file?
 - Is your command prompt "in" the same directory as the file?
   - you can check this by typing ``ls`` on *nix, and ``dir`` on Windows, to see what files are in the dir that the command prompt is in.
 - Did you type *exactly* the same line as above?

What did you just do?
.....................

The "python" command starts up the python interpreter. If you "pass in" a file name, by typing the name of the file after "python", then the interpreter will read that file and run any code that is in it.

In this case, python ran the one line of code you put in that file, which told it to print the text: "this worked!" -- and that is what it did.

The print function
------------------


Text in Python
--------------

Numbers in Python
-----------------









