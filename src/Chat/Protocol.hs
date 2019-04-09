module Chat.Protocol
  ( ServerMsg(..)
  , ClientMsg(..)
  ) where

import Data.Binary
import GHC.Generics

data ServerMsg = ConfirmJoin
               | NameTaken Bool
               | ActiveClients [(Int, String)]
               | ChatRequest Int
               | Notice String
               | MessageFrom (Int, String) String
               deriving(Eq, Show, Generic)

instance Binary ServerMsg

data ClientMsg = RequestJoin
               | CheckName String
               | RegisterName String
               | GetClients
               | ChooseRecip Int
               | Message String
               deriving(Eq, Show, Generic)

instance Binary ClientMsg
