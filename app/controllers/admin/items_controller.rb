class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
end
