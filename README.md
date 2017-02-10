## Spiderman Number Graph

####Input
19,428 total vertexes in the input file and the first 6,486 of them are character vertexes and the remaining are comic book vertexes. Each vertex line contains the vertex number and a string with the character name or comic book title. The “*Edgeslist” line begins the edge list. Each edge line contains a source (character) vertex and one or more (apparently up to 15) target (comic book) vertexes (Williams, 2016).

####Problem
For this problem, a program was developed to compute the Spider Man number for any arbitrary Marvel character.
The computation of a Spider Man number for character X is a shortest path algorithm, applied to the Marvel social graph:

*Spider Man himself has a Spider Man number of 0.
*Those Marvel characters who have appeared in a comic book with Spider Man have a Spider
Man number of 1.
*If the lowest Spider Man number of any Marvel character with whom X has appeared in any
comic book is N, X's Spider Man number is N+1 (Williams, 2016).

####Remarks
Matlab was the programming language used to implement the code. Since C++ does not have a native matrix, let alone an array data type, I decided to forgo using that as a tool to solve this type of problem. Matlab is useful for matrix math, as many of these matrix operations are built into the language and optimized. This allowed for me as a programmer to spend more time rationalizing the logic of solving the problem with graph theory and linear algebra, rather than with the quirks of C++. 
