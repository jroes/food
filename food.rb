require 'rubygems'
require 'bundler/setup'
require 'fatsecret'
require 'awesome_print'
require 'toml'

config = TOML.load_file('config.toml')
FatSecret.init(config['key'], config['secret'])

class FoodFinder
  def self.find(name)
    matching_food = find_food(name)

    if matching_food.first == :found
      food_detail(matching_food.last)
    else
      puts matching_food.last
    end
  end

  private

  def self.with_retry(&block)
    while true
      response = block.call
      awesome_print(response) if ENV['DEBUG']
      break if error_free?(response)
      sleep 5
    end
    response
  end

  def self.error_free?(response)
    !response.has_key? 'error'
  end

  def self.find_food(name)
    matching_food = with_retry do 
      FatSecret.search_food(name)
    end

    return [:not_found, "#{name}: not found"] if matching_food["foods"]["total_results"].to_i == 0
    [:found, matching_food]
  end

  def self.food_detail(matching_food)
    food_detail = with_retry do
      FatSecret.food(matching_food_id(matching_food))
    end

    (food_detail["food"]["brand_name"] || "") + " " +
      food_detail["food"]["food_name"] + ": " + cals_per_serving(food_detail)
  end

  def self.matching_food_id(matching_food)
    food = matching_food["foods"]["food"]
    if food.is_a? Hash
      food["food_id"]
    else
      food.first["food_id"]
    end
  end

  def self.cals_per_serving(food_detail)
    serving = food_detail["food"]["servings"]["serving"]

    if serving.is_a? Hash
      serving["calories"] + "/" + serving["serving_description"]
    else
      serving.map { |serving| serving["calories"] + "/" + serving["serving_description"] }.
        join(", ")
    end
  end
end

STDIN.read.split("\n").each do |line|
  puts FoodFinder.find(line)
end
