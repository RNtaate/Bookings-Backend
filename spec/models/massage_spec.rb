require 'rails_helper'

RSpec.describe Massage, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:price) }

  it { should validate_uniqueness_of(:name) }

  it { should have_one_attached(:massage_image) }
end
