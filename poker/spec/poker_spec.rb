require 'rspec'
require 'card'
require 'player'
require 'hand'
require 'game'
require 'deck'
require 'byebug'
RSpec.describe Card do
  subject (:card) { Card.new("Spade", 14, "Ace")}
  describe "#initialize" do
    it "should take a type and value" do
      expect(card.type).to eq("Spade")
      expect(card.value).to eq(14)
      expect(card.name).to eq("Ace")
      expect(card.hidden).to eq(true)
    end
  end

  describe "#show" do
    it "should show the card" do
      card.show
      expect(card.show).to eq("Spade: Ace")
      expect(card.show).to eq("Spade: Ace")
      expect(card.hidden).to_not eq(true)
    end
  end
end

RSpec.describe Deck do
  subject (:deck) {Deck.new}

  describe "#initialize" do
    it "should create an array of cards" do
      expect(deck.sleeve.class).to eq(Array)
      expect(deck.sleeve.sample.class).to eq(Card)
    end


    it "should shuffle the populated deck" do
      sorted_deck = Deck.populate_deck
      expect(deck.sleeve).to_not eq(sorted_deck)
    end

    it "check that deck has 52 cards" do
      expect(deck.sleeve.length).to eq(52)
    end
  end


end
