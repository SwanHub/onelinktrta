class ArticlesController < ApplicationController
  def index
      @first_link = Link.find(1)
      @links = Link.all
      
      video_linktags = LinkTag.where(tag_id: 2)
      @videos = 
  end
end