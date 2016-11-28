class HomeController < ApplicationController
  def index
  	@blogs = Blog.order(created_at: :desc)
  	@blog = Blog.new
  	@reply = Reply.new
  end
end
