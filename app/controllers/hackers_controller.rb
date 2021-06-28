class HackersController < ApplicationController
  before_action :set_hacker, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: []
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /hackers or /hackers.json
  def index
    @hackers = Hacker.all
  end

  # GET /hackers/1 or /hackers/1.json
  def show
  end

  # GET /hackers/new
  def new
    #@hacker = Hacker.new
    @hacker = current_user.hackers.build
  end

  # GET /hackers/1/edit
  def edit
  end

  # POST /hackers or /hackers.json
  def create
    # @hacker = Hacker.new(hacker_params)
    @hacker = current_user.hackers.build(hacker_params)

    respond_to do |format|
      if @hacker.save
        format.html { redirect_to @hacker, notice: "Hacker was successfully created." }
        format.json { render :show, status: :created, location: @hacker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hacker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hackers/1 or /hackers/1.json
  def update
    respond_to do |format|
      if @hacker.update(hacker_params)
        format.html { redirect_to @hacker, notice: "Hacker was successfully updated." }
        format.json { render :show, status: :ok, location: @hacker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hacker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hackers/1 or /hackers/1.json
  def destroy
    @hacker.destroy
    respond_to do |format|
      format.html { redirect_to hackers_url, notice: "Hacker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @hacker = current_user.hackers.find_by(id: params[:id])
    redirect_to hackers.path, notice: "Not Authorized To Edit This Hacker" if @hacker.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacker
      @hacker = Hacker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hacker_params
      params.require(:hacker).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
