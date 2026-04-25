module Examples where

import Syntax

--example programs

-- Program 1: C Major Scale
-- Ascending C major scale, 2 beats per note, 4/4 time, play once.
-- Covers the full beginner one-octave range from C4 to C5.
--
-- Expected show output:
--   lesson CMajorScale
--           beats 4
--           speed 90
--           times 1
--           play C4 2
--           play D4 2 finger 13
--           play E4 2 finger 12
--           play F4 2 finger 1
--           measure
--           play G4 2
--           play A4 2 finger 12
--           play B4 2 finger 2
--           play C5 2
--           measure
cMajorScale :: Song
cMajorScale = Song "CMajorScale"
  [ Beats 4
  , Speed 90
  , Times 1
  , Play "C4" 2 Nothing
  , Play "D4" 2 (Just "13")
  , Play "E4" 2 (Just "12")
  , Play "F4" 2 (Just "1")
  , Measure
  , Play "G4" 2 Nothing
  , Play "A4" 2 (Just "12")
  , Play "B4" 2 (Just "2")
  , Play "C5" 2 Nothing
  , Measure
  ]


-- Program 2: Counting Fun (rhythm exercise)
-- Uses only C4, E4, G4, C5 so fingers stay relaxed.
-- Focus is entirely on counting varied beat lengths and silences.
-- Play through twice.
--
-- Expected show output:
--   lesson CountingFun
--           beats 4
--           speed 70
--           times 2
--           play C4 1
--           play E4 1 finger 12
--           play G4 2
--           measure
--           play C4 4
--           measure
--           silence 2
--           play G4 1
--           play C5 1
--           measure
--           play C4 2
--           silence 2
--           measure

countingFun :: Song
countingFun = Song "CountingFun"
  [ Beats 4
  , Speed 70
  , Times 2
  , Play "C4" 1 Nothing
  , Play "E4" 1 (Just "12")
  , Play "G4" 2 Nothing
  , Measure
  , Play "C4" 4 Nothing
  , Measure
  , Silence 2
  , Play "G4" 1 Nothing
  , Play "C5" 1 Nothing
  , Measure
  , Play "C4" 2 Nothing
  , Silence 2
  , Measure
  ]

-- Program 3: Valve Drill (finger drill)
-- Targets the two hardest fingering combos: 13 (D4) and 12 (E4, A4).
-- Fast alternating pattern to build muscle memory. Play through 4 times.
--
-- Expected show output:
--   lesson ValveDrill
--           beats 4
--           speed 110
--           times 4
--           play D4 1 finger 13
--           play E4 1 finger 12
--           play D4 1 finger 13
--           play E4 1 finger 12
--           measure
--           play A4 1 finger 12
--           play E4 1 finger 12
--           play A4 1 finger 12
--           play E4 1 finger 12
--           measure
--           play D4 1 finger 13
--           play A4 1 finger 12
--           play D4 1 finger 13
--           play A4 1 finger 12
--           measure
valveDrill :: Song
valveDrill = Song "ValveDrill"
  [ Beats 4
  , Speed 110
  , Times 4
  , Play "D4" 1 (Just "13")
  , Play "E4" 1 (Just "12")
  , Play "D4" 1 (Just "13")
  , Play "E4" 1 (Just "12")
  , Measure
  , Play "A4" 1 (Just "12")
  , Play "E4" 1 (Just "12")
  , Play "A4" 1 (Just "12")
  , Play "E4" 1 (Just "12")
  , Measure
  , Play "D4" 1 (Just "13")
  , Play "A4" 1 (Just "12")
  , Play "D4" 1 (Just "13")
  , Play "A4" 1 (Just "12")
  , Measure
  ]

p1 = [Define "CMajorScale" cMajorScale,
      Define "CountingFun" countingFun,
      Define "ValveDrill" valveDrill,
      Display "CMajorScale", -- in C++
      Display "CountingFun",
      Display "ValveDrill",
      Replace "CMajorScale" 4 (Beats 3),
      Display "CMajorScale"]

{- scratch notes from class discussion -- not code

      Show instances for statements 
      print programs functions get from class-code

      evaluator  go through every simple whenevr define go to env and define, replace, display -- thats what a behavior becomes when it affects the values. my value is a song. values in C++ are arays 

      define main function

      what part was the part you were talking about when you said
       "the part where we have to go through the env and find the song 
      and then replace it with the new song and then display it"
      {-|
      Module      : Examples
      Description : This module contains the implementation of the behavior of various statements.
              Specifically, it handles the logic for processing statements such as 'define'.
              For example, when encountering a 'define' statement, the corresponding song
              is added to the environment. This ensures that the environment is updated
              appropriately based on the statements provided in the input.
      -}
      -- that is the part where we have to implement the behavior of the statements. so for example, when we have a define statement, we have to add that song to our environment.
      
when we have a display statement, we have to look up that song in our environment and print it out. when we have a replace statement, we have to look up that song in our environment, modify it according to the measure and the new statement, and then update our environment with the modified song.

And when she was talking about the show instances for statements, that is the part where we have to implement how to convert our abstract syntax into a string representation that can be printed out. So for example, when we have a Play statement, we have to convert that into a string that says "Play [note] for [duration] beats with fingering [fingering]" or something like that. And when we have a Beats statement, we have to convert that into a string that says "Set beats per measure to [number]". And so on for each type of statement.

What about the part where we have to implement the main function? That is the part where we have to put everything together. We have to define our environment, we have to define our programs, and then we have to execute our programs in order. So for example, we might start with an empty environment, then we execute the first program which defines the CMajorScale song, so we add that to our environment. Then we execute the second program which defines the CountingFun song, so we add that to our environment. Then we execute the third program which defines the ValveDrill song, so we add that to our environment. Then we execute the display statements which look up those songs in our environment and print them out. Then we execute the replace statement which modifies the CMajorScale song in our environment, and then we display it again to see the changes.

so is that what changes my value? yes, the value of your environment changes as you execute each statement. The environment is essentially a mapping from song names to song definitions, and as you execute define statements, you add new songs to the environment. As you execute replace statements, you modify existing songs in the environment. And as you execute display statements, you look up songs in the environment and print them out. So the environment is the central data structure that holds all of your songs and their definitions, and it gets updated as you execute your programs.´

and so the main function is where you would put all of this together. You would define your initial environment, you would define your programs, and then you would execute your programs in order, updating the environment as you go along. And at the end, you would have a final environment that contains all of your songs and their definitions, and you would have printed out the results of your display statements along the way.

and so my programs are made with my language? Yes, your programs are written in the language that you have defined with your abstract syntax. So for example, the cMajorScale program is a Song that is defined using the Song constructor and the list of Measure statements. The countingFun program is also a Song that is defined using the Song constructor and a list of Measure statements. And the valveDrill program is also a Song that is defined using the Song constructor and a list of Measure statements. So all of these programs are written in the language that you have defined with your abstract syntax, and they can be executed by your evaluator to produce the desired output.

-}