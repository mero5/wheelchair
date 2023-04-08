class Public::CategriesController < ApplicationController
  def index
    @categories = Category.all
  end
end
