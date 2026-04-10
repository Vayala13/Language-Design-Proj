-- What is a Token?

-- A token is the smallest meaningful unit that the grammar recognizes — what a **lexer** (scanner) would hand to the parser. In your grammar, every terminal symbol is a token.

---

-- ## Your Token Sequences by Rule

-- Looking at your grammar:


-- <prog>      -> lesson <name> { <stmt> }
--
-- <stmt>      -> beats   <int>
--              | speed   <int>
--              | times   <int>
--              | play    <note> <int> [ finger <fingering> ]
--              | silence <int>
--              | measure
--
-- <note>      -> C4 | D4 | E4 | F4 | G4 | A4 | Bb4 | B4
--              | C5 | D5 | E5 | F5 | G5
--
-- <fingering> -> 1 | 2 | 12 | 13
--
-- <name>      -> ident
-- <int>       -> integer



--There are two kinds of tokens:

---

-- 1. Keyword Tokens — fixed reserved words
-- These are literal words the grammar expects exactly as written:

-- | Token | Appears in |

-- | `lesson` | `<prog>` |
-- | `beats` | `<stmt>` |
-- | `speed` | `<stmt>` |
-- | `times` | `<stmt>` |
-- | `play` | `<stmt>` |
-- | `finger` | `<stmt>` — optional clause inside `play` |
-- | `silence` | `<stmt>` |
-- | `measure` | `<stmt>

--2. Value Tokens — things that carry a specific value

-- | Token           | Category      | Examples                    | Appears in |
-- 
-- |`C4 D4 E4 F4 
-- | G4 A4 Bb4 B4 
-- | C5 D5 E5 F5 G5` | `<note>`      | `C4`, `Bb4`, `G5`           | `play` statement |
--- | ---
-- | `1 2 12 13`     | `<fingering>` | `1`, `12`, `13`             | `finger` clause |
--- | ---
-- | `ident`         | `<name>`      | `CMajorScale`, `ValveDrill` | `<prog>` header |
--- | ---
-- | `integer`       | `<int>`       | `4`, `90`, `110`            | `beats`, `speed`, `times`, `play`, `silence