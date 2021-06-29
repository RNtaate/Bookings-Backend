require 'rails_helper'

RSpec.describe Appointment, type: :model do

  it {should validate_presence_of(:customer_name)}
  it {should validate_presence_of(:massage_type)}
  it {should validate_presence_of(:date)}
  it {should validate_presence_of(:city)}

  it {should belong_to(:user)}
  it {should belong_to(:massage)}
end