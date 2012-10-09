PirateMark
==========

This is a Haxe version of Iain Lobb's "PirateMark" benchmark, designed to work with either NME or Flambe.

It is designed to benchmark the use of large graphic objects with rotation, and is suitable for HTML5 performance tests.

Testing
-------

You can compile the project using NME by opening the directory in the command-prompt or terminal and running:

    nme test html5

Similarly, you can build for Flambe by adding the "use_flambe" define:

    nme test html5 -Duse_flambe

You can also find the benchmark online:

 * http://www.joshuagranick.com/examples/piratemark/html5
 * http://www.joshuagranick.com/examples/piratemark/flambe
