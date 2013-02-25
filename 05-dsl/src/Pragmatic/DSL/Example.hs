{-# LANGUAGE OverloadedStrings #-}

module Pragmatic.DSL.Parser where

import Text.ParserCombinators.Parsec
import Control.Applicative

-- Shameless copy of the "Parsing Stuff in
-- Haskell" talk.

-- "pure" is from applicative;
-- it simply returns the feeded
-- value, in this case True
-- pure :: Applicative f => a -> f a
alwaysTrue :: Parser Bool
alwaysTrue = pure True

-- The trick here is to use the applicative
-- *> to sequence applicatives but keeping track
-- of the failure
-- (*>) :: Applicative f => f a -> f b -> f b
boolTrue :: Parser Bool
boolTrue = (string "true") *> alwaysTrue

