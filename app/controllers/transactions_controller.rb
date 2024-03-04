class TransactionsController < ApplicationController
  def create
    user = User.find(transaction_params[:user_id])

    result = ActiveRecord::Base.transaction do
      user.lock!
      transaction = Transaction.create!(transaction_params)

      if transaction.kind == 'c'
        user.balance += transaction.amount
      else
        user.balance -= transaction.amount
      end

      user.save!
    end

    render json: { limite: user.limit, saldo: user.balance }, status: :ok if result
  end

  private

  def transaction_params
    return @transaction_params if defined?(@transaction_params)

    permitted_params = params.permit(:id, :valor, :tipo, :descricao)

    @transaction_params = {
      user_id: permitted_params[:id],
      amount: permitted_params[:valor],
      kind: permitted_params[:tipo],
      description: permitted_params[:descricao]
    }
  end
end
