Iterators and Generators
=========================


.. rst-class:: large centered

  The Tools of Pythonicity


.. rst-class:: medium

    What goes on in those for loops?

Iterators and Iterables
-----------------------

Iteration is one of the main reasons Python code is so readable:

.. code-block:: python

    for x in just_about_anything:
        do_stuff(x)

An iterable is anything that can be looped over sequentially, so it does not have to be
a "sequence": list, tuple, etc.  For example, a string is iterable.

An iterator is an iterable that remembers state. All sequences are iterable, but
not all sequences are iterators. To make a sequence an iterator, you can call it with iter:

.. code-block:: python

   my_iter = iter(my_sequence)

Iterator Types:

https://docs.python.org/3/library/stdtypes.html#iterator-types

Iterables
---------

To make an object iterable, you simply have to implement the __getitem__ method.

.. code-block:: python

    class T:
        def __getitem__(self, position):
        if position > 5:
            raise IndexError
        return position

Demo


``iter()``
-----------

How do you get the iterator object from an "iterable"?

The iter function will make any iterable an iterator. It first looks for the __iter__
method, and if none is found, uses get_item to create the iterator.

The ``iter()`` function:

.. code-block:: ipython

    In [20]: iter([2,3,4])
    Out[20]: <listiterator at 0x101e01350>

    In [21]: iter("a string")
    Out[21]: <iterator at 0x101e01090>

    In [22]: iter( ('a', 'tuple') )
    Out[22]: <tupleiterator at 0x101e01710>


List as an Iterator:
--------------------

.. code-block:: ipython

    In [10]: a_list = [1,2,3]

    In [11]: list_iter = iter(a_list)

    In [12]: next(list_iter)
    Out[12]: 1

    In [13]: next(list_iter)
    Out[13]: 2

    In [14]: next(list_iter)
    Out[14]: 3

    In [15]: next(list_iter)
    --------------------------------------------------
    StopIteration     Traceback (most recent call last)
    <ipython-input-15-1a7db9b70878> in <module>()
    ----> 1 next(list_iter)
    StopIteration:

Using iterators when you can
----------------------------

Example: trigrams:

.. code-block:: ipython

    triplets = zip(words, words[1:], words[2:])

zip() returns an iterable -- it does not build up the whole list.
So this is quite efficient.

but slicing: ([1:]) produces a copy -- so this does use three copies of
the list -- not so good if memory is tight. Note that they are shallow copies, so not **that** bad.

Nevertheless, we can do better:

.. code-block:: ipython

    from itertools import islice

    In [68]: triplets = zip(words, islice(words, 1, None), islice(words, 2, None))

    In [69]: for triplet in triplets:
        ...:     print(triplet)
        ...:
    ('this', 'that', 'the')
    ('that', 'the', 'other')
    ('the', 'other', 'and')
    ('other', 'and', 'one')
    ('and', 'one', 'more')


The Iterator Protocol
----------------------

The main thing that differentiates an iterator from an iterable (sequence)
is that an iterator saves state.

An iterable must have the following methods:

.. code-block:: python

    an_iterator.__iter__()

Usually returns the iterator object itself.

.. code-block:: python

    an_iterator.__next__()

Returns the next item from the container. If there are no further items,
raises the ``StopIteration`` exception.


Making an Iterator
-------------------

A simple version of ``range()``

.. code-block:: python

    class IterateMe_1:
        def __init__(self, stop=5):
            self.current = 0
            self.stop = stop
        def __iter__(self):
            return self
        def __next__(self):
            if self.current < self.stop:
                self.current += 1
                return self.current
            else:
                raise StopIteration

(demo: :download:`iterator_1.py <../../Examples/Session09/iterator_1.py>`)

What does ``for`` do?
----------------------

Now that we know the iterator protocol, we can write something like a for loop:


:download:`my_for.py <../../Examples/Session09/my_for.py>`

.. code-block:: python

    def my_for(an_iterable, func):
        """
        Emulation of a for loop.

        func() will be called with each item in an_iterable
        """
        # equiv of "for i in l:"
        iterator = iter(an_iterable)
        while True:
            try:
                i = next(iterator)
            except StopIteration:
                break
            func(i)


Itertools
---------

``itertools``  is a collection of utilities that make it easy to
build an iterator that iterates over sequences in various common ways

http://docs.python.org/3/library/itertools.html

NOTE:

iteratables are not *only* for ``for``

They can be used with anything that expects an iterable:

``sum``, ``tuple``, ``sorted``, and ``list``


Generators
----------

Generators

* give you an iterator object
* no access to the underlying data ... if it even exists


Conceptually:
  Iterators are about various ways to loop over data.

  Generators can generate the data on the fly.

Practically:
  You can use either one either way (and a generator is one type of iterator).

  Generators do some of the book-keeping for you -- simpler syntax.

yield
------

``yield``  is a way to make a quickie generator with a function:

.. code-block:: python

    def a_generator_function(params):
        some_stuff
        yield something

Generator functions "yield" a value, rather than returning a value.

State is preserved in between yields.


.. nextslide:: generator functions

A function with ``yield``  in it is a "factory" for a generator

Each time you call it, you get a new generator:

.. code-block:: python

    gen_a = a_generator()
    gen_b = a_generator()

Each instance keeps its own state.

Really just a shorthand for an iterator class that does the book keeping for you.

.. nextslide::

An example: like ``range()``

.. code-block:: python

    def y_range(start, stop, step=1):
        i = start
        while i < stop:
            yield i
            i += step

Real World Example from FloatCanvas:

https://github.com/svn2github/wxPython/blob/master/3rdParty/FloatCanvas/floatcanvas/FloatCanvas.py#L100


.. nextslide::

Note:

.. code-block:: ipython

    In [164]: gen = y_range(2,6)
    In [165]: type(gen)
    Out[165]: generator
    In [166]: dir(gen)
    Out[166]:
    ...
     '__iter__',
    ...
     '__next__',


So the generator **is** an iterator

Note: A generator function can also be a method in a class


More about iterators and generators:

http://www.learningpython.com/2009/02/23/iterators-iterables-and-generators-oh-my/

:download:`yield_example.py <../../Examples/Session09/yield_example.py>`

generator comprehension
-----------------------

yet another way to make a generator:

.. code-block:: python

    >>> [x * 2 for x in [1, 2, 3]]
    [2, 4, 6]
    >>> (x * 2 for x in [1, 2, 3])
    <generator object <genexpr> at 0x10911bf50>
    >>> for n in (x * 2 for x in [1, 2, 3]):
    ...   print n
    ... 2 4 6


More interesting if [1, 2, 3] is also a generator

Note that `map` and `filter` produce iterators.
