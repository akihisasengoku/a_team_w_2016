class HomeController < ApplicationController
  def index
  	@blogs = Blog.all
  	@blog = Blog.new
  	@reply = Reply.new
  end
end
