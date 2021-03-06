class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!

  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = Receipt.all
    role = current_account.employee.department.role
    if role == "Seller"
      @receipts = @receipts.select { |receipt|
        receipt.shop == current_account.employee.shop
      }
      @shop = current_account.employee.shop
    elsif role == "Administrator"
    else
     redirect_to "/", alert: "У вас немає прав для доступу до даної сторінки."
    end
      
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    if current_account.employee.shop == nil
      redirect_to({action: "index"}, alert: "Ви повинні бути прив'язані до магазину для створення замовлень.")
      return
    end
    @receipt = Receipt.new
    @receipt.shop = current_account.employee.shop
    @receipt.employee = current_account.employee
    @all_items = Item.all
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.update_total
    @all_items = Item.all

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: 'Замовлення було успішно створене.' }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params) && @receipt.update_total! 
        format.html { redirect_to @receipt, notice: 'Замовлення було успішно оновлене.' }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: 'Замовлення було успішно видалене.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
      @all_items = Item.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:shop_id, :employee_id, :total, :receipt_items_attributes => [:receipt_id, :item_id, :item_count, :id, :_destroy])
    end
end
