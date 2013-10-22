#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'pry'

if ARGV.any?
  ARGV.each do |item|
    puts FoodFinder.find(item)
  end
else
  STDIN.read.split("\n").each do |line|
    puts FoodFinder.find(line)
  end
end
