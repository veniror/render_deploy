class JobSeekersController < ApplicationController
  before_action :set_job_seeker, only: %i[ show edit update destroy ]
  before_action :admin_loggedin?, only: %i[edit update destroy ]

  # GET /job_seekers or /job_seekers.json
  def index
    @job_seekers = JobSeeker.all
  end

  # GET /job_seekers/1 or /job_seekers/1.json
  def show

    @qr_job_seeker = RQRCode::QRCode.new(job_seeker_url(@job_seeker))
    @qr_job_seeker_image = Base64.encode64(@qr_job_seeker.as_png(size: 100).to_s)

   end

  # GET /job_seekers/new
  def new
    @job_seeker = JobSeeker.new
  end

  # GET /job_seekers/1/edit
  def edit
  end

  # POST /job_seekers or /job_seekers.json
  def create
    @job_seeker = JobSeeker.new(job_seeker_params)

    respond_to do |format|
      if @job_seeker.save
        format.html { redirect_to @job_seeker, notice: "Job seeker was successfully created." }
        format.json { render :show, status: :created, location: @job_seeker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_seekers/1 or /job_seekers/1.json
  def update
    respond_to do |format|
      if @job_seeker.update(job_seeker_params)
        format.html { redirect_to @job_seeker, notice: "Job seeker was successfully updated." }
        format.json { render :show, status: :ok, location: @job_seeker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_seekers/1 or /job_seekers/1.json
  def destroy
    @job_seeker.destroy!

    respond_to do |format|
      format.html { redirect_to job_seekers_path, status: :see_other, notice: "Job seeker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_seeker
      @job_seeker = JobSeeker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_seeker_params
      params.require(:job_seeker).permit(:full_name, :email, :date_of_birth, :mobile, :address,:profile_image)
    end
    def admin_loggedin?
      if session[:admin].nil?
        flash[:notice] = "You need to login as an admin to continue...."
        redirect_to admin_login_url
       end
    end
end
