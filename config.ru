# config.ru
require './config/environment'

use RootController
use ViolationController
use RestaurantController
use CuisineController

run AppController

$stdout.sync = true
