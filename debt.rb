require 'rubygems'
require "bundler/setup"

require_relative 'controllers/menu_controller.rb'

menu = MenuController.new

menu.main_menu
