require 'appium_lib'
require 'cucumber'
require 'test/unit/assertions'
#require 'cucumber/core/ast'

def load_appium_configuration(platform)
  Appium.load_appium_txt :file => File.expand_path("./../../../config/#{platform}/appium.txt", __FILE__), verbose: true
end

def load_module(path)
  Dir[path].each { |file| require file }
end

class AppiumWorld
end

if ENV['PLATFORM_NAME'].nil?
  raise 'Please define the PLATFORM_NAME environment variable like: export PLATFORM_NAME=android'
else
  env = ENV['PLATFORM_NAME'].downcase
end

case env
  when 'android'
    caps = load_appium_configuration(env)
    caps[:appium_lib][:export_session]=true
    load_module('./features/pages/android/*.rb')

    $ENV = Android

  when 'ios'
    caps = load_appium_configuration(env)
    caps[:appium_lib][:export_session]=true
    load_module('./features/pages/ios/*.rb')

    $ENV = IOS

  else
    raise("Not supported platform #{ENV['PLATFORM_NAME']}")
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods AppiumWorld

# world settings
World(Test::Unit::Assertions)

World do
  AppiumWorld.new
  AssertExtension.new
end

