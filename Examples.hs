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

-- Program 4: full pipeline (defines all three lessons, displays each,
-- replaces the time signature of CMajorScale, then displays it again).
p1 :: Program
p1 = [ Define  "CMajorScale" cMajorScale
     , Define  "CountingFun" countingFun
     , Define  "ValveDrill"  valveDrill
     , Display "CMajorScale"
     , Display "CountingFun"
     , Display "ValveDrill"
     , Replace "CMajorScale" 4 (Beats 3)
     , Display "CMajorScale"
     ]