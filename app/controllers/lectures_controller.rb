class LecturesController < ApplicationController
  # before_action :calculate_attendance, only: [:index]
 	before_action :qr_code, only: [:generate_qr]
  
  def index
    if current_user
      # @try = calculate_attendance
   		@lecture = Lecture.all
    else
      flash[:warning] = "You should not Access this page"
      redirect_to '/'
    end
 	end

 	def show
   	@lecture = Lecture.find(params[:id])
    # @attendance = Attendanc
    cookies[:exist_lecture] = params[:id]
  end

  def new
    if current_user
      @lecture = Lecture.new
    else
      flash[:warning] = "You Should not Access this page as a student"
      redirect_to '/'
    end
  end
  
  def student_list
    @lecture = Lecture.find(params[:lecture_id])
    @attendance = Attendance.where("lecture_id = ? AND present = ?", @lecture.id, true)
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

  # def calculate_attendance
  #   uid = current_user.id
  #   @lecture = Lecture.where('user_id = ?', uid)
  #   @lecture.each do |x|
  #   @calc_attendance = Attendance.where("present = ? AND lecture_id = ?", true, @lecture.id)
  #   p @calc_attendance
  #   @total = @calc_attendance.count
  #   return @total
  # end

  def set_lecture
      @lecture = Lecture.find(params[:id])
  end

  def generate_qr
    uid = current_user.id
    @lecture = Lecture.find(params[:lecture_id])
    # change domain name after deployment because we are using localhost for now
    @domain = 'http://localhost:3000/'
    @param = "lectures/#{@lecture.id.to_i}"
    @link = @domain + @param 
    @qr = RQRCode::QRCode.new("#{@link}")
    return @qr
  end

  # def late_check
  #   uid = current_user.id
  #   @lecture = Lecture.find(params[:id])
  #   @late = Attendance.where("present = ?", true)
  #   @late.each do |obj|
  #     if obj.created_at <= @lectures.start_time
  #       # student
  #     end
  #   end  
  # end
end
