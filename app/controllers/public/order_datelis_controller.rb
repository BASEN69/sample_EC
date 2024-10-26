class Public::OrderDatelisController < ApplicationController
  before_action :authenticate_customer!
end
