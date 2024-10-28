class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
end
