module Lib where

import qualified Data.Map as M
import Data.List.NonEmpty

someFunc :: IO ()
someFunc = putStrLn "someFunc"


data ImageFormat = ImageFormat { height:: Int, width:: Int, url:: String } deriving (Eq, Show)

data PictureData = PictureData { formats:: M.Map String ImageFormat } deriving (Eq, Show)

type PicturesData = [PictureData]

findIdealUrl::PictureData -> Int -> Maybe String
findIdealUrl _ _ = Just ""

findIdealUrl2::[ImageFormat] -> Int -> Maybe String
findIdealUrl2 l _ = undefined

findIdealUrl3::NonEmpty ImageFormat -> Int -> String
findIdealUrl3 _ _ = undefined
