class LecturesController < ApplicationController

  # before_action :calculate_attendance, only: [:index]
 	before_action :qr_code, only: [:generate_qr]
  
  def index
    if current_user
   		@lecture = Lecture.all
    else
      flash[:warning] = "You should not Access this page"
      redirect_to '/'
    end
 	end

 	def show
    if current_user
      flash[:warning] = "You Should Not Access This Page"
      return redirect_to lectures_path
    else
     	@lecture = Lecture.find(params[:id])
      cookies[:lecture] = params[:id]
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

  
  def student_list
    if current_user
      @lecture = Lecture.find(params[:lecture_id])
      @attendance = Attendance.where("lecture_id = ?", @lecture.id)
    else
      flash[:danger] = "You Need To Sign In To Access That Page"
      return redirect_to root_path
    end
  end


  def create
    if current_user
      @lecture = Lecture.new(name: params["lecture"]["name"], user_id: current_user.id, subject_name: params["lecture"]["subject_name"])
      @lecture.save
      flash[:success] = "Lecture is Created"
      redirect_to lectures_path
    else
      flash[:danger] = "You need to Log In enter That Page"
    end
  end

  def new_student
  end

  def create_student
    @temp_student = Student.create(email: params[:email])
    flash[:success] = "Student Created"
    redirect_to lectures_path
  end
  # use to generate qr code
  def qr_code
    if current_user
      @get_qr = generate_qr  
    else
      flash[:warning] = "You should not Access this page"
      redirect_to "/"
    end
    render :layout => false
  end

  def dashboard
    now = Date.current
    @x = Attendance.where('DATE(updated_at) = ?', now)
    @lecture_name = []
    @data = []
    Lecture.all.each do |lecture|
      @lecture_name << lecture.name
      @data << Attendance.where("lecture_id = ?",lecture.id).count
    end
  end

  def reported
    @absent = 0
    @notabsent = 0
    @start = params[:start]
    @end = params[:end]
    range = (@end.to_date - @start.to_date ).to_i + 1
    p range
    (@start..@end).each do |date|
      @attendance = Attendance.where('DATE(updated_at) = ? AND lecture_id = ?', date)
      @attendance.each do |x|
        if x.present == true
          @notabsent += 1
        else
          @absent += 1
        end
      end
    end
  end

  private

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
end
