class Restaurant < ActiveRecord::Base
  attr_accessible :name, :street_address, :zip, :cuisine, :inspection_date, :violation, :current_grade
  belongs_to :game_zip

   VIOLATIONS = {
    "04L" => "Rats!",
    "01B" => "Document issued by the Board, Commissioner or Department unlawfully reproduced or altered.",
    "01C" => "Notice issued by the Board, Commissioner or Department unlawfully reproduced or altered.",
    "02A" => "Food not cooked to required minimum temperature.",
    "02F" => "Meat, fish or molluscan shellfish served raw or undercooked without prior notification to customer.",
    "03A" => "Food from unapproved or unknown source, spoiled, adulterated, or home canned.",
    "03D" => "Canned food product observed swollen, leaking, and rusted.",
    "03G" => "Raw food not properly washed prior to serving.",
    "04B" => "Food worker prepares food or handles utensil when ill with a disease transmissible by food, or have exposed infected cut or burn on their hand.",
    "04E" => "Toxic chemical improperly labeled, stored or used so that contamination of food may occur.",
    "04F" => "Food, food preparation area, food storage area, area used by employees or patrons, contaminated by sewage or liquid waste.",
    "04I" => "Food item spoiled, adulterated, contaminated or cross-contaminated.",
    "04M" => "Mice",
    "04N" => "Roaches"
    }

  CUISINE = { 
    "01"=>"Afghan",
    "02"=>"African",
    "03"=>"American",
    "04"=>"Armenian",
    "05"=>"Asian",
    "06"=>"Australian",
    "07"=>"Bagels/Pretzels",
    "08"=>"Bakery",
    "09"=>"Bangladeshi",
    "10"=>"Barbecue",
    "11"=>"Basque",
    "12"=>"Bottled beverages, including water, sodas, juices, etc.",
    "13"=>"Brazilian",
    "14"=>"Cafe/Coffee/Tea",
    "15"=>"Cajun",
    "16"=>"Californian",
    "17"=>"Caribbean",
    "18"=>"Chicken",
    "19"=>"Chilean",
    "20"=>"Chinese",
    "21"=>"Chinese/Cuban",
    "22"=>"Chinese/Japanese",
    "23"=>"Continental",
    "24"=>"Creole",
    "25"=>"Creole/Cajun",
    "26"=>"Czech",
    "27"=>"Delicatessen",
    "28"=>"Vietnamese/Cambodian/Malaysia",
    "29"=>"Donuts",
    "30"=>"Eastern European",
    "31"=>"Egyptian",
    "32"=>"English",
    "33"=>"Ethiopian",
    "34"=>"Filipino",
    "35"=>"French",
    "36"=>"Fruits/Vegetables",
    "37"=>"German",
    "38"=>"Greek",
    "39"=>"Hamburgers",
    "40"=>"Hawaiian",
    "41"=>"Hotdogs",
    "42"=>"Hotdogs/Pretzels",
    "43"=>"Ice Cream, Gelato, Yogurt, Ices",
    "44"=>"Indian",
    "45"=>"Indonesian",
    "46"=>"Iranian",
    "47"=>"Irish",
    "48"=>"Italian",
    "49"=>"Japanese",
    "50"=>"Jewish/Kosher",
    "51"=>"Juice, Smoothies, Fruit Salads",
    "52"=>"Korean",
    "53"=>"Latin (Cuban, Dominican, Puerto Rican, South & Central American)",
    "54"=>"Mediterranean",
    "55"=>"Mexican",
    "56"=>"Middle Eastern",
    "57"=>"Moroccan",
    "58"=>"Nuts/Confectionary",
    "59"=>"Pakistani",
    "60"=>"Pancakes/Waffles",
    "61"=>"Peruvian",
    "62"=>"Pizza",
    "63"=>"Pizza/Italian",
    "64"=>"Polish",
    "65"=>"Polynesian",
    "66"=>"Portuguese",
    "67"=>"Russian",
    "68"=>"Salads",
    "69"=>"Sandwiches",
    "70"=>"Sandwiches/Salads/Mixed Buffet",
    "71"=>"Scandinavian",
    "72"=>"Seafood",
    "73"=>"Soul Food",
    "74"=>"Soups",
    "75"=>"Soups & Sandwiches",
    "76"=>"Southwestern",
    "77"=>"Spanish",
    "78"=>"Steak",
    "80"=>"Tapas",
    "81"=>"Tex-Mex",
    "82"=>"Thai",
    "83"=>"Turkish",
    "84"=>"Vegetarian",
    "99"=>"Other",
    "00"=>"Not Listed/Not Applicable" }

  def self.make_restaurant_json
    desired_data = [1, 3, 4, 5, 7, 8, 10, 12]
    column_names = [:name, :street_address, :zip, :cuisine, :inspection_date, :violation, :current_grade]
    formatted_array = []

    rows = File.open("#{Rails.public_path}/data/inspections.txt").readlines
    rows.shift
    rows.each do |line|
      temp_array = []
      temp_hash = {}
      is_complete = true
      element_array = line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '').split("\",\"")
      element_array.each_with_index do |data_element, index|
        is_complete = false if (data_element.class == NilClass && index != 10)
        if desired_data.include?(index) && is_complete
          data_element = data_element.gsub("\"", "").gsub("   ", " ").gsub("  ", " ").strip
          case index
            when 4
              temp_array[1].concat(" " + data_element)
            when 7
              data_element = CUISINE[data_element]
              temp_array << data_element
            when 8
              puts data_element
              is_complete = false unless Time.parse(data_element) > 6.month.ago
              temp_array << data_element
            when 10
              if VIOLATIONS.include?(data_element)
                data_element = VIOLATIONS[data_element]
              elsif data_element == nil
                data_element = "NONE"
              else
                data_element = "boring"
              end
              temp_array << data_element
            when 12
              is_complete = false if data_element == ""
              data_element = "Pending" if data_element == "P"
              data_element = "Closed" if data_element == "Z"
              temp_array << data_element
            else
              temp_array << data_element
          end
        end
      end
      temp_array.each_with_index {|item, index| temp_hash[column_names[index]] = item}
      puts is_complete
      formatted_array << temp_hash if is_complete
    end
    File.open("#{Rails.public_path}/data/formatted_inspections.json", "w"){|file| file.write(JSON.pretty_generate(formatted_array))}
  end

  def self.make_restaurants
    file = File.open("#{Rails.public_path}/data/formatted_inspections.json")
    parsed_file = JSON.parse(file.read)
    parsed_file.each do |restaurant|
      Restaurant.new(restaurant).save
    end
  end
   

end
