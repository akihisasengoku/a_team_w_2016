class BlogsController < ApplicationController

	def create
	    @blog = Blog.new(blog_params)
	    if @blog.save
        	redirect_to root_path, notice: 'Blog was successfully created.' 
      	else
      		@blogs = Blog.all
		  	@reply = Reply.new
        	render template: "home/index"
      	end
	end

	def like
		blog = Blog.find(params[:id])
		blog.like += 1
		if blog.save
			redirect_to root_path, notice: 'Like was successfully created.'
		else
			redirect_to root_path, notice: 'Like was not successfully created.'
		end
	end

	private

    def blog_params
    	params.require(:blog).permit(:body, :like)
    end
end
