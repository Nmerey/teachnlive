class SubjectsController < ApplicationController
# before_action :subject_params, only [:new]
 	def index
 		@subject = Subject.all
 	end

 	def show
    	@subject = Subject.find(params[:id])
  	end

 	def new
 		@subject = Subject.new
 	end


 	def create
 		p params["subject"]["name"]
 	  # @subject = Subject.new
 	  @subject = Subject.new(name: params["subject"]["name"], user_id: params["subject"]["user_id"])
 	  p @subject
      @subject.save
      redirect_to '/'
    end

 	private

 	def set_subject
      @subject = Subject.find(params[:id])
    end

 	# def subject_params
 	# 	params.require(:subjects).permit(:name, :user_id)
 	# end
end
