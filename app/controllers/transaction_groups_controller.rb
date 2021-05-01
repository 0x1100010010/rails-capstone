class TransactionGroupsController < ApplicationController
  before_action :set_transaction_group, only: %i[show edit update destroy]

  def index
    @transaction_groups = TransactionGroup.all
  end

  def show; end

  def new
    @transaction_group = TransactionGroup.new
  end

  def edit; end

  def create
    @transaction_group = TransactionGroup.new(transaction_group_params)

    respond_to do |format|
      if @transaction_group.save
        format.html { redirect_to request.referrer, notice: 'Transaction group was successfully created.' }
        format.json { render :show, status: :created, location: @transaction_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @transaction_group.update(transaction_group_params)
        format.html { redirect_to @transaction_group, notice: 'Transaction group was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction_group.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Transaction group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_transaction_group
    @transaction_group = TransactionGroup.find(params[:id])
  end

  def transaction_group_params
    params.permit(:group_id, :transaction_id)
  end
end
