class Api::V1::InvoicesController < ApplicationController
  before_action :set_api_v1_invoice, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /api/v1/invoices
  def index
    @api_v1_invoices = Api::V1::Invoice.where(nil)
    @api_v1_invoices = @api_v1_invoices.filter_by_status(params[:api_v1_invoices][:status]) if params[:api_v1_invoices][:status].present?
    @api_v1_invoices = @api_v1_invoices.filter_by_emitter(params[:api_v1_invoices][:emitter]) if params[:api_v1_invoices][:emitter].present?
    @api_v1_invoices = @api_v1_invoices.filter_by_receiver(params[:api_v1_invoices][:receiver]) if params[:api_v1_invoices][:receiver].present?
    @api_v1_invoices = @api_v1_invoices.filter_by_amount(params[:api_v1_invoices][:amount]) if params[:api_v1_invoices][:amount].present?
    render json: { 
      data: @api_v1_invoices, 
      total_amount: @api_v1_invoices.pluck(:amount).sum.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    }, status: 200
  end

  # GET /api/v1/invoices/1
  def show
    render json: @api_v1_invoice
  end

  # POST /api/v1/invoices
  def create
    @api_v1_invoice = Api::V1::Invoice.new(api_v1_invoice_params)
    @api_v1_invoice.receiver = current_user.email
    @api_v1_invoice.emitted_at = Date.today.to_s
    if @api_v1_invoice.save
      render json: @api_v1_invoice, status: :created, location: @api_v1_invoice
    else
      render json: @api_v1_invoice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/invoices/1
  def update
    if @api_v1_invoice.update(api_v1_invoice_params)
      render json: @api_v1_invoice
    else
      render json: @api_v1_invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/invoices/1
  def destroy
    @api_v1_invoice.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_invoice
      @api_v1_invoice = Api::V1::Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_invoice_params
      params.require(:api_v1_invoice).permit(:status, :emitter, :receiver, :amount, :emitted_at)
    end
end
