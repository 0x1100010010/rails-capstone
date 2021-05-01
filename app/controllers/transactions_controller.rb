class TransactionsController < ApplicationController
  include TransactionsHelper
  before_action :set_transaction, only: %i[show edit update destroy]

  def index
    @transactions = current_user.transactions.order(created_at: :desc).includes(:transaction_groups)
  end

  def show
    @groups = current_user.groups.all
  end

  def index_external_transactions
    @transactions = current_user.external_transactions
  end

  def new
    @groups = current_user.groups.all
    @transaction = current_user.transactions.new
  end

  def edit; end

  def create
    @transaction = current_user.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :user_id)
  end
end
