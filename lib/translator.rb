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
  emoticons_hash = load_library(file)
  emoticons_hash.each do |english_word, emoticon_hash|
    if emoticon == emoticon_hash[:english]
      return emoticon_hash[:japanese]
    end
  end
  return "Sorry, that emoticon was not found" 
end

def get_english_meaning(file, emoticon)
  emoticons_hash = load_library(file)
  emoticons_hash.each do |english_meaning, emoticon_hash|
    if emoticon == emoticon_hash[:japanese]
      return english_meaning
    end
  end
  return "Sorry, that emoticon was not found" 
end
