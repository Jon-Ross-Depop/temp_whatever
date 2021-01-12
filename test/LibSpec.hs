module LibSpec where

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck.Property
import Lib
import qualified Data.Map as M
import Data.Maybe
import Test.QuickCheck.Arbitrary
import Test.QuickCheck.Gen

imageFormatGen::Gen ImageFormat
imageFormatGen = ImageFormat <$> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary ImageFormat where
    arbitrary = imageFormatGen

pictureDataGen::Gen PictureData
pictureDataGen = PictureData <$> arbitrary

instance Arbitrary PictureData where
    arbitrary = pictureDataGen

spec :: Spec
spec = describe "Simple test" $ do

     it "example-based unit test" $
        1 `shouldBe` 1

     prop "property-based unit test" $
        \l -> reverse ( reverse l ) == ( l::[Int])

     -- prop url is one of the inputs
     prop "given empty set, when finding ideal url, then return Nothing" $
        \ x -> findIdealUrl (PictureData M.empty) x == Nothing

     prop "given non-empty set, when finding ideal url, then return something" $
        \ p x -> not(M.null (formats p)) ==> isJust (findIdealUrl p x)
