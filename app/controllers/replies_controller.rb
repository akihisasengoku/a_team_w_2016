class RepliesController < ApplicationController
	def create
    	@reply = Reply.new(reply_params)

      	if @reply.save
        	redirect_to root_path, notice: 'Reply was successfully created.' 
      	else
      		redirect_to root_path, notice: 'Failed to create Reply.' 
      	end
    end

    private
	    def reply_params
	      params.require(:reply).permit(:blog_id, :comment)
	    end
end
