class Admin::AddressesController < ApplicationController
  before_action :authenticate_admin!
end
