module CookingLang where
--context free grammer cooking
    {-
    <Program> -> <stmts>
    <stmts> -> [<stmt>]
    <stmt> -> create recipe <recipe>
              | display <recipename>
              | replace <recipename> <int> <step>
              | change baking temperature <recipename> <temperature>
              | change baking time < recipename> <time>
              | change boiling temperature <recipename> <temperature>
              | change boiling time < recipename> <time>
              | change roasting temperature <recipename> <temperature>
              | change roasting time < recipename> <time>
              | change grilling temperature <recipename> <temperature>
              | change grilling time < recipename> <time>
              | change frying temperature <recipename> <temperature>
              | change frying time < recipename> <time>

  --  <recipes> -> <recipe> <recipes> | <recipe>
    <recipe> -> "Recipe" <recipeName> <steps>
    <steps> -> <step> <steps> | <step>
    <step> -> "Add" <ingredient> <amount>
            | "Mix"  <time>
            | "Bake" <temperature> <Time>
            | "Boil" <temperature> <Time>
            | "Roast" <temperature>  <Time>
            | "Grill" <temperature>  <Time>
            | "Fry" <temperature>  <Time>
    <time> -> int <MeasuringTime>
    <MeasuringTime> -> "seconds" | "minutes"
            
    <recipeName> -> String
    <ingredient> -> String
    <amount> -> String
    <temperature> -> Int

    <env> -> [(<recipename>, <recipe>)]
-}
    
--abstract syntaxs
type RecipeName = String -- type synonyms
type Temperature = Int
type Program = [Stmt]
data Stmt = CreateR Recipe -- ADT
            | Display RecipeName
            | Replace RecipeName Int Step
            | ChangeBkTemp RecipeName Temperature
            | ChangeBkTime RecipeName Time
            | ChangeBlTemp RecipeName Temperature
            | ChangeBlTime RecipeName Time
            | ChangeRtTemp RecipeName Temperature
            | ChangeRtTime RecipeName Time
            | ChangeGlTemp RecipeName Temperature
            | ChangeGlTime RecipeName Time
            | ChangeFyTemp RecipeName Temperature
            | ChangeFyTime RecipeName Time
            deriving (Eq)
            
  

data Recipe = Recipe String [Step]
  deriving (Eq)

data Step = Add String String 
          | Mix Time
          | Bake Int Time
          | Boil Int Time
          | Roast Int Time
          | Grill Int Time
          | Fry Int Time
          deriving (Eq)
    
data Time = Time Int MeasuringTime
  deriving (Eq)
data MeasuringTime = Seconds | Minutes
  deriving (Eq)

type Env = [(RecipeName, Recipe)]    

--instance 
    
instance Show Recipe where
  show (Recipe name steps) = " Recipe " ++ name  ++  "\n" ++  showSteps steps-- unlines (map show steps)

showSteps :: [Step] -> String
showSteps ss = showIterator 1 ss

showIterator :: Int -> [Step] -> String
showIterator _ [] = ""
showIterator n [s] = show n ++ ": " ++  show s
showIterator n (s:ss) = show n ++ ": " ++ show s ++ "\n" ++ showIterator (n+1) ss

instance Show Step where
  show (Add ingredient amount) = " Add " ++ ingredient ++ " " ++ amount
  show (Mix t) = " Mix " ++ show t
  show (Bake temp t) = " Bake " ++ show temp ++ " " ++ show t
  show (Boil temp t) = " Boil " ++ show temp ++ " " ++ show t
  show (Roast temp t) = " Roast " ++ show temp ++ " " ++ show t
  show (Grill temp t) = " Grill " ++ show temp ++ " " ++ show t
  show (Fry temp t) = " Fry " ++ show temp ++ " " ++ show t
 
instance Show Time where
 show(Time n unit) = show n ++ " " ++ show unit
 
instance Show MeasuringTime where
  show Seconds = "seconds"
  show Minutes = "minutes"

instance Show Stmt where 
  show (CreateR recipe) = "Create recipe " ++ show recipe
  show (Display name) = "Display " ++ name
  show (Replace name num step) = "Replace step " ++ show num ++ " in " ++ name ++ " with step " ++ show step
  show (ChangeBkTemp name temp) = "Change the baking temperature of " ++ name ++ " to " ++ show temp
  show (ChangeBkTime name time) = "Change the baking time of " ++ name ++ " to " ++ show time
  show (ChangeBlTemp name temp) = "Change the boiling temperature of " ++ name ++ " to " ++ show temp
  show (ChangeBlTime name time) = "Change the boiling time of " ++ name ++ " to " ++ show time
  show (ChangeRtTemp name temp) = "Change the roasting temperature of " ++ name ++ " to " ++ show temp
  show (ChangeRtTime name time) = "Change the roasting time of " ++ name ++ " to " ++ show time
  show (ChangeGlTemp name temp) = "Change the grilling temperature of " ++ name ++ " to " ++ show temp
  show (ChangeGlTime name time) = "Change the grilling time of " ++ name ++ " to " ++ show time
  show (ChangeFyTemp name temp) = "Change the frying temperature of " ++ name ++ " to " ++ show temp
  show (ChangeFyTime name time) = "Change the frying time of " ++ name ++ " to " ++ show time