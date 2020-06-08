class StaticPagesController < ApplicationController
  before_action :authenticate_account!

  def home
  end

  def analysis
  end
end
