# config.ru
require './config/environment'

run MessagesApp

$stdout.sync = true
