class ArticlesController < ApplicationController
  def index
      @first_link = Link.find(1)
      @links = Link.all
      
      @video_objects = []

      LinkTag.where(tag_id: 2).each do |vlink|
        @video_objects.push(Link.find(vlink.link_id))
      end
      
  end
end