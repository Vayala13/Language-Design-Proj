module Main where
import Syntax
import Eval
import Examples

-- Demo entry point.
--
-- 1. Prints the source program via the custom pretty printer
--    (printProgram from Syntax.hs).
-- 2. Evaluates the program starting from an empty environment.
-- 3. Prints output produced by display statements.
-- 4. Prints the final environment.

main :: IO ()
main = do
    banner "Source program (custom pretty-printer)"
    putStr (printProgram p1)

    let (finalEnv, output) = run p1

    banner "Display output (evaluator)"
    putStr output

    banner "Final environment"
    putStrLn (printEnv finalEnv)

banner :: String -> IO ()
banner title = do
    putStrLn ""
    putStrLn ("====== " ++ title ++ " ======")
