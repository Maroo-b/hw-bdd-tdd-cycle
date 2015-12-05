require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do

  describe "GET#same_movie_director" do
    context "movie has no director" do
      before(:each) do
        @movie = Movie.create(title: "Test", director: nil)
        get :same_movie_director , id: @movie.id
      end
      it "display msg if no movie found" do
        expect(flash[:notice]).to eq("'#{@movie.title}' has no director info")
      end
      it "redirect to home page" do
        expect(response).to redirect_to(movies_path)
      end
    end
  end
    
end