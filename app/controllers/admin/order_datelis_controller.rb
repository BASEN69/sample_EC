class Admin::OrderDatelisController < ApplicationController
  before_action :authenticate_admin!
end
