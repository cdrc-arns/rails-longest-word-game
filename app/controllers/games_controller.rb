require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @grid = []
    10.times { @grid << ('A'..'Z').to_a.sample }
    @grid
  end

  def score
    grid = params[:grid].split('')
    @attempt = params[:attempt]

  end

  def dictionnary
    @answer = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    word_dictionary = URI.open(url).read
    word = JSON.parse(word_dictionary)
    word['found']
  end
end
