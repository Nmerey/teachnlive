class LecturesController < ApplicationController
  # before_action :set_property, only: [:show, :edit, :update, :destroy]
before_action :calculate_attendance, only: [:index]
 	def index
    @try = calculate_attendance
 		@lecture = Lecture.all
 	end

 	def show
   	@lecture = Lecture.find(params[:id])
    @qr = RQRCode::QRCode.new('http://github.com/', :size => 4, :level => :h )
    # response["set-cookie"]="lecture=#{@lecture.id}"
    cookies[:lecture] = @lecture.id
  end

 	def new
 		@lecture = Lecture.new
  end


  def create
    @lecture = Lecture.new(name: params["lecture"]["name"], user_id: params["lecture"]["user_id"])
    @lecture.save
    flash[:warning] = "Lecture is done saving"
    redirect_to '/'
  end

  private

  def calculate_attendance
    uid = current_user.id
    @lecture = Lecture.find_by('user_id = ?', uid)
    p @lecture
    @calc_attendance = Attendance.where("present = ? AND lecture_id = ?", true, @lecture.id)
    p @calc_attendance
    @total = @calc_attendance.count
    return @total
  end

 	def set_lecture
      @lecture = Lecture.find(params[:id])
  end

end
