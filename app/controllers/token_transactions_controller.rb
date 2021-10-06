class TokenTransactionsController < ApplicationController

  # GET /token_transactions
  def index
    @token_transactions = TokenTransaction.successful
    @average_spent_gas = TokenTransaction.average_spent_gas
  end

end
