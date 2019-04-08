module Chat.Protocol
  ( ServerMsg(..)
  , ClientMsg(..)
  ) where

import Data.Binary
import GHC.Generics

data ServerMsg = ConfirmJoin
               | NameTaken Bool
               | ActiveClients [String]
               | Notice String
               | MessageFrom String String
               deriving(Eq, Show, Generic)

instance Binary ServerMsg

data ClientMsg = RequestJoin
               | CheckName String
               | RegisterName String
               | GetClients
               | ChooseRecip String
               | Message String
               deriving(Eq, Show, Generic)

instance Binary ClientMsg
