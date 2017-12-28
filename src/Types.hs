module Types where

data Token = TokenNewline           -- '\n'
           | TokenNatNum Int        -- an integer
           | TokenH Int             -- header with amount of hashes
           | TokenText String       -- text
           | TokenBlanks Int        -- blanks with amount
           | TokenOpeningBracket
           | TokenClosingBracket
           | TokenOpeningParenthesis
           | TokenClosingParenthesis
           | TokenQuote             -- '"'
           | TokenGraveAccent       -- '`'
           | TokenExclamationMark   -- '!'
           | TokenBackslash         -- '\'
           | TokenIndentedCodeBlock -- '\n' plus 4 blanks
           | TokenColon             -- colon used in a link reference
           | TokenDash              -- dash used for a list
           | TokenDot               -- dot for a potential list
           | TokenAsterisks Int     -- emphasis (*) with amount (1 is normal, 2 is strong)

    deriving (Show, Eq)

-- Abstract Syntax Tree used for creating a html document
data AST = Sequence [AST]   -- a sequence of html elements
         | Text String
         | Emptyline
         | H Int AST        -- a header with according number (int) and AST representing its content
         | P [AST]          -- a paragraph with content
         | Emphasis [AST]       -- *italic*
         | StrongEmphasis [AST] -- **bold**
         | BulletList [AST]     -- '-'
         | OrderedList [AST]    -- '1. 2. 3. ...'
         | ListItem [AST]
         | CodeSpan [AST]
         | HardLineBreak        -- <br /> (2 or more blanks at the end of a paragraph-line)
         | CodeBlock [AST]
         | Backslash
         | Image String String String       -- Image (Image description, Image destination, Image title)
         | Link String String String        -- Link (Link text, Link destination, Link title)
         | LinkReference String String      -- LinkReference (Link lable, Link destination)
         | PossibleLinkReference String     -- PossibleLinkReference text

    deriving (Eq, Show)
