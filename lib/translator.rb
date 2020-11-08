require 'yaml'
require 'pry'

def load_library(path)

  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new	
  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new

  emoticons.each do |english_word, emoticon_set|
    temp_hash = Hash.new
    temp_hash[:english] = emoticon_set[0]
    temp_hash[:japanese] = emoticon_set[1]
    emoticon_hash[english_word] = temp_hash
  end
  emoticon_hash
end

def get_japanese_emoticon(file, emoticon)
  emoticon_hash = load_library(file)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(file, japanese_emoticon)
  emoticon_hash = load_library(file)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end 