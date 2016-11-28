class BlogsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def create
	    @blog = Blog.new(blog_params)
	    if !@blog.save
      		redirect_to root_path, alert: 'Failed to create Blog.'
      	end

      	@reply = Reply.new
	end

	def like
		@blog = Blog.find(params[:id])
		@blog.like += 1
		@blog.save
	end

	private

    def blog_params
    	params.require(:blog).permit(:body, :like)
    end
end
