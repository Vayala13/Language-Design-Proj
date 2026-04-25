module Eval where
import Syntax

-- Evaluator / interpreter for the trumpet practice language.
--
-- A program is evaluated against an environment of song
-- definitions. Each statement either updates the environment
-- (define / replace) or produces output (display).

-- evalStmt :: Env -> Stmt -> (Env, String)
-- Returns the updated environment plus any text produced by the
-- statement (only Display actually produces output).
evalStmt :: Env -> Stmt -> (Env, String)
evalStmt env (Define name song) =
    (bind name song env, "")

evalStmt env (Display name) = case lookup name env of
    Just song -> (env, show song ++ "\n")
    Nothing   -> (env, "-- error: song '" ++ name ++ "' is not defined\n")

evalStmt env (Replace name n msr) = case lookup name env of
    Just (Song sname msrs) ->
        let newSong = Song sname (replaceAt n msr msrs)
        in (bind name newSong env, "")
    Nothing ->
        (env, "-- error: song '" ++ name ++ "' is not defined\n")

-- evalProgram :: Env -> Program -> (Env, String)
-- Thread the environment through each statement in order,
-- concatenating any output.
evalProgram :: Env -> Program -> (Env, String)
evalProgram env []       = (env, "")
evalProgram env (s : ss) =
    let (env',  out1) = evalStmt env s
        (env'', out2) = evalProgram env' ss
    in  (env'', out1 ++ out2)

-- run :: Program -> (Env, String)
-- Convenience wrapper: evaluate starting from an empty environment.
run :: Program -> (Env, String)
run = evalProgram []

-- bind :: Name -> Song -> Env -> Env
-- Insert (or overwrite) a song in the environment. Rebinding
-- replaces the existing entry rather than shadowing it, so the
-- environment always has at most one entry per name.
bind :: Name -> Song -> Env -> Env
bind name song env = (name, song) : filter ((/= name) . fst) env

-- replaceAt :: Int -> a -> [a] -> [a]
-- Replace the nth element of a list (1-indexed).
-- Out-of-range indices leave the list unchanged.
replaceAt :: Int -> a -> [a] -> [a]
replaceAt _ _ []     = []
replaceAt 1 x (_:ys) = x : ys
replaceAt n x (y:ys)
    | n > 1     = y : replaceAt (n - 1) x ys
    | otherwise = y : ys
