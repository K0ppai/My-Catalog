require_relative '../spec_helper'

describe Book do

  before :all do
    p "Book testing"
  end

  before :each do
    @new_book1 = Book.new("2009-2-23", "Book Publisher", "bad")
    @new_book2 = Book.new("1934-12-2", "Publishing House", "good")
    @new_book3 = Book.new("2019-4-3", "Pub House", "excellent")
  end

  describe "#initialize" do
    context "When making a new book" do
      it "takes 3 parameters and returns a new book object" do
      expect(@new_book1).to be_an_instance_of Book
      expect(@new_book2).to be_an_instance_of Book
      expect(@new_book3).to be_an_instance_of Book
    end
    end

  end

  describe "#methods" do
    context "can_be_archived?" do
      it "should return true if cover_state = bad" do
        expect(@new_book1.can_be_archived?).to be true
        expect(@new_book2.can_be_archived?).to be true
        expect(@new_book3.can_be_archived?).to be false
      end
    end
  end

end


# Implement methods:

# can_be_archived?() in the Book class
# should override the method from the parent class
# should return true if parent's method returns true OR if cover_state equals to "bad"
# otherwise, it should return false