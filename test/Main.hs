module Main (main, User(..)) where

data User = User {
    firstName :: String
  , lastName :: String
}

user :: User
user = User "Eshmat" "Toshmatov"


main :: IO ()
main = putStrLn "Test suite not yet implemented."

