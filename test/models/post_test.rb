# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  blog_id          :integer          not null
#  title            :string           not null
#  body             :text             not null
#  content_type     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  filepicker_url   :string
#  blog_picture_url :string
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
