{-# LANGUAGE TemplateHaskell #-}

-- | A simple example using getElementById and file-embed

module Main where

import           GHCJS.DOM
import           GHCJS.DOM.Document
import           GHCJS.DOM.HTMLElement

import           Control.Applicative
import           Data.ByteString       (ByteString)
import           Data.FileEmbed
import           Data.Text.Encoding

main :: IO ()
main = do
  Just doc <- currentDocument
  Just body <- documentGetBody doc
  htmlElementSetInnerHTML body $ decodeUtf8 initialHtml
  Just days <- (fmap . fmap) castToHTMLElement $ documentGetElementById doc "dday"
  htmlElementSetInnerText days "1"
  Just hours <- (fmap . fmap) castToHTMLElement $ documentGetElementById doc "dhour"
  htmlElementSetInnerText hours "2"
  Just minutes <- (fmap . fmap) castToHTMLElement $ documentGetElementById doc "dmin"
  htmlElementSetInnerText minutes "3"
  Just seconds <- (fmap . fmap) castToHTMLElement $ documentGetElementById doc "dsec"
  htmlElementSetInnerText seconds "4"


initialHtml :: ByteString
initialHtml = $(embedFile "inner.html")
