module Syntax where
import Data.List (intercalate)
--context free grammar

-- trumpet practice
    {-
    <program>  -> <stmts>
    <stmts>    -> <stmt><stmts> | epsilon
    <stmt>     -> define <name> <song>
                | display <name>
                | replace <name> <int> <measure>

    <song>     -> lesson <name> <measures>
    <measures> -> <measure><measures> | epsilon
    <measure>  -> beats <int>
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

    -- environment
    <env> -> [(<name>, <song>)]
    -}

-- abstract syntax
-- Define :: Name -> Song -> Stmt
type Program = [Stmt]
printProgram :: Program -> String 
printProgram [] = ""
printProgram (s : ss) = show s ++ printProgram ss

data Stmt = Define Name Song
          | Display Name
          | Replace Name Int Measure
    -- deriving Show

type Name      = String
type Note      = String
type Fingering = String

instance Show Stmt where
    show (Define name song)   = "define " ++ name ++ " as\n" ++ show song
    show (Display name)       = "display " ++ name ++ "\n"
    show (Replace name n msr) = "replace " ++ name ++ " " ++ show n ++ " with " ++ show msr ++ "\n"

-- Song :: Name -> [Measure] -> Song
data Song = Song Name [Measure]
    deriving Eq
    -- deriving Show

instance Show Song where
    show (Song name msrs) = "lesson " ++ name ++ "\n" ++ printMeasures msrs

printMeasures :: [Measure] -> String
printMeasures [] = ""
printMeasures (m : ms) = "\t" ++ show m ++ "\n" ++ printMeasures ms

-- Beats :: Int -> Measure
data Measure = Beats Int
             | Speed Int
             | Times Int
             | Play Note Int (Maybe Fingering)
             | Silence Int
             | Measure
             deriving Eq
    -- deriving Show

instance Show Measure where
    show (Beats n)                = "beats " ++ show n
    show (Speed n)                = "speed " ++ show n
    show (Times n)                = "times " ++ show n
    show (Play note dur Nothing)  = "play " ++ note ++ " " ++ show dur
    show (Play note dur (Just f)) = "play " ++ note ++ " " ++ show dur ++ " finger " ++ f
    show (Silence n)              = "silence " ++ show n
    show Measure                  = "measure"

type Env = [(Name, Song)]

printEnv :: Env -> String
printEnv env = intercalate "\n" songs
    where
        songs = map (show . snd) env    -- Env => [String]
