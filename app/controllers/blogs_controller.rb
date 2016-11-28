class BlogsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_action :set_blog, only: [:like]

	def create
	    @blog = Blog.new(blog_params)
	    if @blog.save
        	redirect_to root_path, notice: 'Blog was successfully created.' 
      	else
      		redirect_to root_path, alert: 'Failed to create Blog.'
      	end
	end

	def like
		@blog.like += 1
		if @blog.save
			redirect_to root_path, notice: 'Like was successfully created.'
		else
			redirect_to root_path, alert: 'Failed to create Like.'
		end
	end

	private

	def set_blog
		@blog = Blog.find(params[:id])
	end

    def blog_params
    	params.require(:blog).permit(:body, :like)
    end
end
