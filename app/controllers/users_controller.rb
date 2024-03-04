class UsersController < ApplicationController
  def show
    user = User.find(params[:id])

    body = {
      saldo: {
        total: user.balance,
        data_extrato: Time.current,
        limite: user.limit
      },
      ultimas_transacoes: user.transactions.order(id: :desc).limit(10).map do |transaction|
        {
          valor: transaction.amount,
          tipo: transaction.kind,
          descricao: transaction.description,
          realizada_em: transaction.created_at
        }
      end
    }

    render json: body, status: :ok
  end
end
