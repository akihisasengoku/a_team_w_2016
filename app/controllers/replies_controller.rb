class RepliesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def create
    	@reply = Reply.new(reply_params)
      	if !@reply.save
      		redirect_to root_path, alert: 'Failed to create Reply.' 
      	end
    end

    private
	    def reply_params
	      params.require(:reply).permit(:blog_id, :comment)
	    end
end
