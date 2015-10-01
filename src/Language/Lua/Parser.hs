module Language.Lua.Parser
  ( A.parseText
  , A.parseNamedText
  , parseFile
  , stat
  , exp
  , chunk
  ) where

import           Control.Monad                   (liftM)
import           Prelude                         hiding (exp)

import qualified Language.Lua.Annotated.Parser   as A
import           Language.Lua.Annotated.Lexer (LTok,SourcePos)
import           Language.Lua.Annotated.Simplify
import           Language.Lua.Syntax

parseFile :: FilePath -> IO (Either (String,SourcePos) Block)
parseFile = liftM (liftM sBlock) . A.parseFile

stat :: A.Parser Stat
stat = fmap sStat A.stat

exp :: A.Parser Exp
exp = fmap sExp A.exp

chunk :: A.Parser Block
chunk = fmap sBlock A.chunk
