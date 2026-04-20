module Examples where

import Syntax

--example programs

-- Program 1: C Major Scale
-- Ascending C major scale, 2 beats per note, 4/4 time, play once.
-- Covers the full beginner one-octave range from C4 to C5.
--
-- Expected show output:
--   Lesson CMajorScale
--  1: Set beats per measure to 4
--  2: Set tempo to 90 bpm
--  3: Repeat the lesson 1 times
--  4: Play C4 for 2 beats open
--  5: Play D4 for 2 beats with fingering 13
--  6: Play E4 for 2 beats with fingering 12
--  7: Play F4 for 2 beats with fingering 1
--  8: Barline
--  9: Play G4 for 2 beats open
-- 10: Play A4 for 2 beats with fingering 12
-- 11: Play B4 for 2 beats with fingering 2
-- 12: Play C5 for 2 beats open
-- 13: Barline
cMajorScale :: Prog
cMajorScale = Prog "CMajorScale"
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
--   Lesson CountingFun
--  1: Set beats per measure to 4
--  2: Set tempo to 70 bpm
--  3: Repeat the lesson 2 times
--  4: Play C4 for 1 beats open
--  5: Play E4 for 1 beats with fingering 12
--  6: Play G4 for 2 beats open
--  7: Barline
--  8: Play C4 for 4 beats open
--  9: Barline
-- 10: Rest for 2 beats
-- 11: Play G4 for 1 beats open
-- 12: Play C5 for 1 beats open
-- 13: Barline
-- 14: Play C4 for 2 beats open
-- 15: Rest for 2 beats
-- 16: Barline
countingFun :: Prog
countingFun = Prog "CountingFun"
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
--   Lesson ValveDrill
--  1: Set beats per measure to 4
--  2: Set tempo to 110 bpm
--  3: Repeat the lesson 4 times
--  4: Play D4 for 1 beats with fingering 13
--  5: Play E4 for 1 beats with fingering 12
--  6: Play D4 for 1 beats with fingering 13
--  7: Play E4 for 1 beats with fingering 12
--  8: Barline
--  9: Play A4 for 1 beats with fingering 12
-- 10: Play E4 for 1 beats with fingering 12
-- 11: Play A4 for 1 beats with fingering 12
-- 12: Play E4 for 1 beats with fingering 12
-- 13: Barline
-- 14: Play D4 for 1 beats with fingering 13
-- 15: Play A4 for 1 beats with fingering 12
-- 16: Play D4 for 1 beats with fingering 13
-- 17: Play A4 for 1 beats with fingering 12
-- 18: Barline
valveDrill :: Prog
valveDrill = Prog "ValveDrill"
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
