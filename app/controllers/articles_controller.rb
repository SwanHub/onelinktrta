class ArticlesController < ApplicationController
  
  def index
    @most_recent_link = Link.last
  end

  def all
    @all_links = Link.all.order(:id)
  end 

  def learn
    @learn_links = []

    LinkTag.where(tag_id: 1).each do |learn_link|
      @learn_links.push(Link.find(learn_link.link_id))
    end
  end

  def video
    @video_links = []

    LinkTag.where(tag_id: 2).each do |video_link|
      @video_links.push(Link.find(video_link.link_id))
    end
  end

  def text
    @text_links = []

    LinkTag.where(tag_id: 3).each do |text_link|
      @text_links.push(Link.find(text_link.link_id))
    end
  end

  def music
    @music_links = []

    LinkTag.where(tag_id: 4).each do |music_link|
      @music_links.push(Link.find(music_link.link_id))
    end
  end

  def game
    @game_links = []

    LinkTag.where(tag_id: 5).each do |game_link|
      @game_links.push(Link.find(game_link.link_id))
    end
  end
end