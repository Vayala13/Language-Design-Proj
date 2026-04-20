module Syntax where
--context free grammer trumpet practice
    {-
    <Program> -> lesson <name> <stmts>
    <stmts> -> [<stmt>]
    <stmt> -> beats <int>
            | speed <int>
            | times <int>
            | play <note> <int>
            | play <note> <int> finger <fingering>
            | silence <int>
            | measure

    -- Notes in scientific pitch notation (C4 is middle C):
    <note> -> C4 | D4 | E4 | F4 | G4 | A4 | Bb4 | B4
            | C5 | D5 | E5 | F5 | G5

    -- Valves pressed down (no clause = open hand):
    --   open  ->  C4, G4, C5, G5
    --   1     ->  F4, Bb4, F5
    --   2     ->  B4
    --   12    ->  E4, A4, E5
    --   13    ->  D4, D5
    <fingering> -> 1 | 2 | 12 | 13

    <name> -> String
    <int>  -> Int

    <env> -> [(<name>, <Prog>)]
-}

--abstract syntax
type Name = String -- type synonyms
type Note = String
type Fingering = String

data Prog = Prog Name [Stmt] -- ADT
  deriving (Eq)

data Stmt = Beats Int
          | Speed Int
          | Times Int
          | Play Note Int (Maybe Fingering)
          | Silence Int
          | Measure
          deriving (Eq)

type Env = [(Name, Prog)]

--instance

instance Show Prog where
  show (Prog name stmts) = " Lesson " ++ name ++ "\n" ++ showStmts stmts

showStmts :: [Stmt] -> String
showStmts ss = showIterator 1 ss

showIterator :: Int -> [Stmt] -> String
showIterator _ [] = ""
showIterator n [s] = show n ++ ": " ++ show s
showIterator n (s:ss) = show n ++ ": " ++ show s ++ "\n" ++ showIterator (n+1) ss

instance Show Stmt where
  show (Beats n) = "Set beats per measure to " ++ show n
  show (Speed n) = "Set tempo to " ++ show n ++ " bpm"
  show (Times n) = "Repeat the lesson " ++ show n ++ " times"
  show (Play note dur Nothing) = "Play " ++ note ++ " for " ++ show dur ++ " beats open"
  show (Play note dur (Just f)) = "Play " ++ note ++ " for " ++ show dur ++ " beats with fingering " ++ f
  show (Silence n) = "Rest for " ++ show n ++ " beats"
  show Measure = "Barline"
