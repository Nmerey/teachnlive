class LecturesController < ApplicationController
  before_action :calculate_attendance, only: [:index]
 	before_action :qr_code, only: [:generate_qr]
  
  def index
    if current_user
      @try = calculate_attendance
   		@lecture = Lecture.all
    else
      flash[:warning] = "You should not Access this page"
      redirect_to '/'
    end
 	end

 	def show
    if current_user
     	@lecture = Lecture.find(params[:id])
      cookies[:lecture] = @lecture.id
    else
      flash[:warning] = "You Should not Access this page"
      redirect_to '/'
    end
  end

  def new
    if current_user
      @lecture = Lecture.new
    else
      flash[:warning] = "You Should not Access this page as a student"
      redirect_to '/'
    end
  end


  def create
    @lecture = Lecture.new(name: params["lecture"]["name"], user_id: current_user.id)
    @lecture.save
    flash[:warning] = "Lecture is done saving"
    redirect_to '/'
  end

  def qr_code
    if current_user
      @get_qr = generate_qr  
    else
      flash[:warning] = "You should not Access this page"
      redirect_to "/"
    end
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

  def generate_qr
    uid = current_user.id
    @lecture = Lecture.find(params[:lecture_id])
    # change domain name after deployment because we are using localhost for now
    @domain = 'http://localhost:3000/'
    @param = 'lectures/#{@lecture.id.to_i}'
    @qr = RQRCode::QRCode.new('#{@domain}#{param}', :size => 4, :level => :h )
    return @qr
  end
end
