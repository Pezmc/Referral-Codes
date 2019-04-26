class CodesController < ApplicationController
  before_action :set_code, only: [:show]

  def index
  end

  def random
    @code = Code.order(visits: :asc).order("RANDOM()").first
    @code.increment!(:visits) if @code

    render :show
  end

  def show
  end

  # GET /codes/new
  def new
    @code = Code.new
  end

  # POST /codes
  # POST /codes.json
  def create
    # Add validation
    @code = Code.find_or_initialize_by(code: code_params[:code].strip)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully added.' }
        format.json { render :show, status: :created, location: @code }
      else
        format.html { render :new }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_code
      @code = Code.find(params[:id])
    end

    def code_params
      params.fetch(:code, {}).permit(:code)
    end
end
