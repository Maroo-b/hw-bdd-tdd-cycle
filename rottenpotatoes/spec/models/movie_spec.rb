require 'rails_helper'

describe Movie do
    
    before(:each) do
       @movie1 = Movie.create(director: 'tester') 
       @movie2 = Movie.create(director: 'tester') 
       @movie3 = Movie.create(director: 'user') 
       @movie4 = Movie.create(director: nil) 
    end
    
    describe " #find_similar_director" do
      
      it " returns Movie with similar director" do
        expect(@movie1.find_similar_director.size).to eq(1)
      end
        
      it "returns nil when movie has no director" do
        expect(@movie4.find_similar_director.blank?).to be_truthy
      end
    end
    
    
end