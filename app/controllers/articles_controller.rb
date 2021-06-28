class ArticlesController < ApplicationController
  def index
      @first_link = Link.find(1)
      @links = Link.all
  end
end