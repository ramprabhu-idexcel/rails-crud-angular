class VisitorsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_visitor, only:[:update]
  respond_to :json,:html

  def index
    respond_to do |format|
      format.json { render json: Visitor.all }
      format.html
    end
  end

  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      render json: @visitor, status: :ok
    else
      render json: {visitor_errors: @visitor.errors.full_messages, status: :no_content}
    end
  end

  def destroy
    respond_with Visitor.destroy(params[:id])
  end

  def update
    if @visitor.update(visitor_params)
      render json: @visitor, status: :ok
    else
      render json: {visitor_errors: @visitor.errors.full_messages, status: :no_content}
    end
  end

  private
  def visitor_params
    params.require(:visitor).permit(:id, :first_name, :last_name, :sex, :age, :phone_no, :location, :reason, :contact_person, :id_proof, :id_number, :auto_generate_id, :created_at,:updated_at) unless params[:visitor].empty?
  end

  def get_visitor
    @visitor = Visitor.find(params[:id])
  end
end


