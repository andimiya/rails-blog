class AccountsController < ApplicationController
  def index
    redirect_to new_account_path
  end

  def new
    @account = Account.new
  end
end
