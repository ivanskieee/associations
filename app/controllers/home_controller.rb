class HomeController < ApplicationController
  def index
    @authors = Author.all
    @books = Book.all
  end
end
