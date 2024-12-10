
import qualified Data.Text as T
import Data.Int (Int64)

module Logementry.Types where

data AttributeValue = StringValue String
                    | IntValue Int
                    | BoolValue Bool
                    | DoubleValue Double
                    | NullValue
  deriving (Show, Eq)

data Severity = Trace | Debug | Info | Warning | Error | Fatal
  deriving (Eq, Ord, Show, Read, Enum)

data LogRecord = LogRecord {
    logTimeNano       :: Int64,
    severityNumber    :: Int,  
    severityText      :: Severity,
    logBody           :: AttributeValue,
    attributes        :: [(String, AttributeValue)],
    droppedCount      :: Int,
    traceId           :: String,
    spanId            :: String
} deriving (Show, Eq)

data Scope = Scope deriving (Show, Eq)

data Resource = Resource {
    resourceAttributes :: [(String, AttributeValue)]
} deriving (Show, Eq)

data LogEntry where
    LogEntry :: {
        resourceLogs :: [(Resource, [(Scope, [LogRecord])])]
    } -> LogEntry
  deriving (Show, Eq)
