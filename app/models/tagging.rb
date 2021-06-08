# == Schema Information
#
# Table name: taggings
#
#  id         :bigint           not null, primary key
#  tag_id     :bigint           not null
#  recipe_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :recipe
end
