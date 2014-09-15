class EmploysController < ApplicationController
    load_and_authorize_resource
  before_action :set_employ, only: [:show, :edit, :update, :destroy]

  # GET /employs
  # GET /employs.json
  def index
    @employs = Employ.all
  end

  # GET /employs/1
  # GET /employs/1.json
  def show
  end

  # GET /employs/new
  def new
    @employ = Employ.new
  end

  # GET /employs/1/edit
  def edit
  end

  # POST /employs
  # POST /employs.json
  def create
    @employ = Employ.new(employ_params)

    #respond_to do |format|
      if @employ.save
        EmployMailer.send_mail_after_create(params[:employ][:email]).deliver! 
        flash[:notice] = "Employee was successfully created"
        redirect_to employs_path
      else
        flash[:error] = "Error while creating Employee"
        render "new"
      end
    #end
  end

  # PATCH/PUT /employs/1
  # PATCH/PUT /employs/1.json
  def update
    respond_to do |format|
      if @employ.update(employ_params)
        format.html { redirect_to @employ, notice: 'Employ was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employ.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employs/1
  # DELETE /employs/1.json
  def destroy
    @employ.destroy
    respond_to do |format|
      format.html { redirect_to employs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employ
      @employ = Employ.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employ_params
      params.require(:employ).permit(:first_name, :last_name, :role, :email, :dob, :designation)
    end
end
