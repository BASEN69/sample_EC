class Public::AddressesController < ApplicationController
   before_action :authenticate_customer!
end
