module CFG where

-- ============================================================
-- 1. CONTEXT-FREE GRAMMAR
--
-- ============================================================
--  Bb Trumpet Practice Lesson Language
-- ============================================================
--  Notation:
--    { x }  zero or more repetitions
--    [ x ]  optional (zero or one)
--    |      alternative
--
--  Lexical terminals:
--    ident   ::= letter { letter | digit }
--    integer ::= digit { digit }
--
--  Note names use scientific pitch notation:
--    letter = pitch name, number = octave
--    C4 = middle C, C5 = one octave higher
-- ============================================================
--
-- <prog>      -> lesson <name> { <stmt> }
--
-- <stmt>      -> beats   <int>
--              | speed   <int>
--              | times   <int>
--              | play    <note> <int> [ finger <fingering> ]
--              | silence <int>
--              | measure
--
-- Notes in the 6th-grade beginner trumpet range (C4 to G5):
-- <note>      -> C4 | D4 | E4 | F4 | G4 | A4 | Bb4 | B4
--              | C5 | D5 | E5 | F5 | G5
--
-- Fingerings -- valves pressed down (no clause = open hand):
--   open  ->  C4, G4, C5, G5
--   1     ->  F4, Bb4, F5
--   2     ->  B4
--   12    ->  E4, A4, E5
--   13    ->  D4, D5
-- <fingering> -> 1 | 2 | 12 | 13
--
-- <name>      -> ident
-- <int>       -> integer

-- ============================================================
-- 2. ABSTRACT SYNTAX
-- ============================================================

type Name      = String
type Note      = String
type Fingering = String

data Prog = Prog Name [Stmt]
  deriving (Eq)

data Stmt
  = Beats   Int
  | Speed   Int
  | Times   Int
  | Play    Note Int (Maybe Fingering)
  | Silence Int
  | Measure
  deriving (Eq)

-- ============================================================
-- 3. SHOW INSTANCES
-- ============================================================

instance Show Prog where
  show :: Prog -> String
  show (Prog name stmts) =
    "lesson " ++ name ++ "\n" ++ unlines (map show stmts)

instance Show Stmt where
  show (Beats n)                = "beats "   ++ show n
  show (Speed n)                = "speed "   ++ show n
  show (Times n)                = "times "   ++ show n
  show (Play note dur Nothing)  = "play "    ++ note ++ " " ++ show dur
  show (Play note dur (Just f)) = "play "    ++ note ++ " " ++ show dur ++ " finger " ++ f
  show (Silence n)              = "silence " ++ show n
  show Measure                  = "measure"

-- ============================================================
-- 4. EXAMPLE PROGRAMS
-- ============================================================

-- Program 1: C Major Scale
-- Ascending C major scale, 2 beats per note, 4/4 time, play once.
-- Covers the full beginner one-octave range from C4 to C5.
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
